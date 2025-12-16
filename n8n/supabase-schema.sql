-- Riley Content System - Supabase Schema
-- Self-Learning Content Database with Vector Search
-- Run this in Supabase SQL Editor after enabling pgvector extension

-- ============================================
-- ENABLE REQUIRED EXTENSIONS
-- ============================================

create extension if not exists vector;

-- ============================================
-- CORE TABLES
-- ============================================

-- Posted Content: Every piece of content you actually post
-- This is the heart of the self-learning system
create table if not exists posted_content (
  id uuid default gen_random_uuid() primary key,
  
  -- Content details
  content_text text not null,
  platform text not null check (platform in ('twitter', 'linkedin', 'thread')),
  content_type text not null check (content_type in ('tweet', 'thread_hook', 'thread_body', 'linkedin_post', 'field_guide')),
  
  -- Grouping and context
  week_topic text,                    -- The field guide topic this came from
  week_start_date date,               -- Week this content belongs to
  category text,                      -- e.g., 'harsh_truth', 'offer_mechanics', 'one_liner'
  content_pillar text,                -- e.g., 'Offer Mechanics', 'Harsh Marketing Truths'
  
  -- Timing
  posted_date timestamp with time zone,
  created_at timestamp with time zone default now(),
  
  -- Vector embedding for semantic search (1536 dimensions for OpenAI embeddings)
  embedding vector(1536),
  
  -- Status tracking
  status text default 'approved' check (status in ('draft', 'approved', 'posted', 'archived')),
  
  -- Metadata as JSON for flexibility
  metadata jsonb default '{}'::jsonb
);

-- Content Performance: Track metrics for each piece of content (Layer 3 prep)
create table if not exists content_performance (
  id uuid default gen_random_uuid() primary key,
  content_id uuid references posted_content(id) on delete cascade,
  
  -- Core metrics
  impressions integer default 0,
  engagements integer default 0,
  likes integer default 0,
  comments integer default 0,
  shares integer default 0,
  clicks integer default 0,
  
  -- Calculated metrics
  engagement_rate numeric(5,4),       -- engagements / impressions
  
  -- Timestamps
  metrics_date date,                  -- When these metrics were captured
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now(),
  
  -- Raw API response for debugging
  raw_metrics jsonb default '{}'::jsonb
);

-- Voice Evolution: Track how Riley's voice changes over time
create table if not exists voice_evolution (
  id uuid default gen_random_uuid() primary key,
  
  -- Time period
  week_start_date date not null,
  
  -- Voice snapshot
  tone_markers jsonb,                 -- Which tone markers were prominent
  vocabulary_patterns jsonb,          -- Frequently used terms
  sentence_patterns jsonb,            -- Opening hooks, transitions used
  content_pillar_distribution jsonb,  -- Actual distribution that week
  
  -- Analysis
  voice_score numeric(3,2),           -- Overall voice consistency 0-10
  notable_shifts text,                -- AI-generated summary of changes
  
  -- Timestamps
  created_at timestamp with time zone default now()
);

-- Field Guides: Store complete field guides for reference
create table if not exists field_guides (
  id uuid default gen_random_uuid() primary key,
  
  -- Content
  topic text not null,
  content text not null,
  parsed_content jsonb,               -- Structured extraction from Node 5
  
  -- Context
  week_start_date date,
  
  -- Vector for semantic search
  embedding vector(1536),
  
  -- Timestamps
  created_at timestamp with time zone default now()
);

-- Learning Patterns: Store successful content patterns (like the video's query memory)
create table if not exists learning_patterns (
  id uuid default gen_random_uuid() primary key,
  
  -- Pattern details
  pattern_type text not null,         -- 'hook', 'structure', 'topic_angle', 'cta'
  pattern_description text not null,
  example_content text,
  
  -- Success metrics
  avg_engagement_rate numeric(5,4),
  times_used integer default 1,
  success_score numeric(3,2),         -- 0-10 based on performance
  
  -- Vector for semantic retrieval
  embedding vector(1536),
  
  -- Timestamps
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- ============================================
-- INDEXES FOR PERFORMANCE
-- ============================================

-- Vector similarity search indexes (using IVFFlat for good balance of speed/accuracy)
create index if not exists posted_content_embedding_idx 
  on posted_content using ivfflat (embedding vector_cosine_ops)
  with (lists = 100);

create index if not exists field_guides_embedding_idx 
  on field_guides using ivfflat (embedding vector_cosine_ops)
  with (lists = 50);

create index if not exists learning_patterns_embedding_idx 
  on learning_patterns using ivfflat (embedding vector_cosine_ops)
  with (lists = 50);

-- Standard indexes for common queries
create index if not exists posted_content_platform_idx on posted_content(platform);
create index if not exists posted_content_week_idx on posted_content(week_start_date);
create index if not exists posted_content_status_idx on posted_content(status);
create index if not exists posted_content_created_idx on posted_content(created_at desc);

create index if not exists content_performance_content_idx on content_performance(content_id);
create index if not exists content_performance_date_idx on content_performance(metrics_date);

-- ============================================
-- FUNCTIONS FOR SEMANTIC SEARCH
-- ============================================

-- Find similar past content (for avoiding repetition and finding patterns)
create or replace function match_similar_content(
  query_embedding vector(1536),
  match_threshold float default 0.7,
  match_count int default 10,
  filter_platform text default null,
  filter_days_back int default 90
)
returns table (
  id uuid,
  content_text text,
  platform text,
  content_type text,
  week_topic text,
  category text,
  posted_date timestamp with time zone,
  similarity float
)
language plpgsql
as $$
begin
  return query
  select
    pc.id,
    pc.content_text,
    pc.platform,
    pc.content_type,
    pc.week_topic,
    pc.category,
    pc.posted_date,
    1 - (pc.embedding <=> query_embedding) as similarity
  from posted_content pc
  where 
    pc.embedding is not null
    and 1 - (pc.embedding <=> query_embedding) > match_threshold
    and (filter_platform is null or pc.platform = filter_platform)
    and pc.created_at > now() - make_interval(days => filter_days_back)
  order by pc.embedding <=> query_embedding
  limit match_count;
end;
$$;

-- Find successful patterns for a given topic/style
create or replace function match_learning_patterns(
  query_embedding vector(1536),
  match_threshold float default 0.6,
  match_count int default 5,
  min_success_score float default 5.0
)
returns table (
  id uuid,
  pattern_type text,
  pattern_description text,
  example_content text,
  success_score numeric,
  similarity float
)
language plpgsql
as $$
begin
  return query
  select
    lp.id,
    lp.pattern_type,
    lp.pattern_description,
    lp.example_content,
    lp.success_score,
    1 - (lp.embedding <=> query_embedding) as similarity
  from learning_patterns lp
  where 
    lp.embedding is not null
    and 1 - (lp.embedding <=> query_embedding) > match_threshold
    and lp.success_score >= min_success_score
  order by lp.embedding <=> query_embedding
  limit match_count;
end;
$$;

-- Get recent content to avoid repetition (simple recency check)
create or replace function get_recent_content(
  days_back int default 14,
  limit_count int default 50
)
returns table (
  id uuid,
  content_text text,
  platform text,
  content_type text,
  category text,
  created_at timestamp with time zone
)
language plpgsql
as $$
begin
  return query
  select
    pc.id,
    pc.content_text,
    pc.platform,
    pc.content_type,
    pc.category,
    pc.created_at
  from posted_content pc
  where pc.created_at > now() - make_interval(days => days_back)
  order by pc.created_at desc
  limit limit_count;
end;
$$;

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================

-- Enable RLS on all tables
alter table posted_content enable row level security;
alter table content_performance enable row level security;
alter table voice_evolution enable row level security;
alter table field_guides enable row level security;
alter table learning_patterns enable row level security;

-- Allow service role full access (n8n uses service role key)
create policy "Service role has full access to posted_content"
  on posted_content for all
  using (auth.role() = 'service_role');

create policy "Service role has full access to content_performance"
  on content_performance for all
  using (auth.role() = 'service_role');

create policy "Service role has full access to voice_evolution"
  on voice_evolution for all
  using (auth.role() = 'service_role');

create policy "Service role has full access to field_guides"
  on field_guides for all
  using (auth.role() = 'service_role');

create policy "Service role has full access to learning_patterns"
  on learning_patterns for all
  using (auth.role() = 'service_role');

-- ============================================
-- HELPER VIEWS
-- ============================================

-- Content with performance metrics joined
create or replace view content_with_metrics as
select
  pc.*,
  cp.impressions,
  cp.engagements,
  cp.likes,
  cp.comments,
  cp.shares,
  cp.engagement_rate
from posted_content pc
left join content_performance cp on pc.id = cp.content_id;

-- Weekly content summary
create or replace view weekly_content_summary as
select
  week_start_date,
  week_topic,
  count(*) filter (where platform = 'twitter' and content_type = 'tweet') as tweet_count,
  count(*) filter (where platform = 'twitter' and content_type like 'thread%') as thread_count,
  count(*) filter (where platform = 'linkedin') as linkedin_count,
  count(*) as total_content
from posted_content
where week_start_date is not null
group by week_start_date, week_topic
order by week_start_date desc;

-- ============================================
-- INITIAL DATA VALIDATION
-- ============================================

-- Verify setup was successful
do $$
begin
  raise notice 'Schema setup complete!';
  raise notice 'Tables created: posted_content, content_performance, voice_evolution, field_guides, learning_patterns';
  raise notice 'Functions created: match_similar_content, match_learning_patterns, get_recent_content';
  raise notice 'Views created: content_with_metrics, weekly_content_summary';
end $$;

