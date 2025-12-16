# Setting Up API Credentials for n8n

This guide walks you through setting up all required API credentials for the Riley Content System.

## Required Credentials

| Service | Required | Purpose |
|---------|----------|---------|
| Anthropic (Claude) | **Yes** | All AI generation nodes |
| Supabase | **Yes** | Self-learning content database with vector search |
| OpenAI | **Yes** | Embeddings for semantic search in learning system |
| Slack Webhook | **Yes** | Notifications |
| Hypefury | Recommended | Twitter scheduling |
| Twitter API | Optional | Direct posting (backup) |
| LinkedIn API | Optional | Direct posting (complex setup) |

---

## 1. Anthropic (Claude) API

### Why Needed
All AI generation in the workflow uses Claude. This is the most important credential.

### Setup Steps
1. Go to [Anthropic Console](https://console.anthropic.com/)
2. Sign up or log in
3. Navigate to **Settings > API Keys**
4. Click **Create Key**
5. Copy the key (starts with `sk-ant-api03-`)

### In n8n
1. Go to **Settings > Credentials**
2. Click **Add Credential**
3. Search for "Anthropic"
4. Paste your API key
5. Name it "Anthropic API"

### Cost Estimate
- Claude Sonnet: ~$3 per 1M input tokens, ~$15 per 1M output tokens
- Typical weekly run: ~50,000 tokens = ~$0.50-$1.00

---

## 2. Slack Webhook

### Why Needed
Sends notifications when content is ready for review or scheduled.

### Setup Steps
1. Go to [Slack API](https://api.slack.com/apps)
2. Click **Create New App** > **From scratch**
3. Name it "Riley Content System"
4. Select your workspace
5. Go to **Incoming Webhooks**
6. Toggle **Activate Incoming Webhooks** to On
7. Click **Add New Webhook to Workspace**
8. Select the channel for notifications
9. Copy the webhook URL

### In n8n
1. The webhook URL is used directly in HTTP Request nodes
2. Update the `slack_webhook` parameter in the Input Configuration node

---

## 3. Supabase (Self-Learning Database)

### Why Needed
Powers the self-learning content system. Stores all posted content with vector embeddings so the AI can:
- Learn from your content evolution over time
- Avoid repeating similar content
- Retrieve relevant past successes when generating new content

### Setup Steps

#### Create Supabase Project
1. Go to [Supabase](https://supabase.com/) and sign up/log in
2. Click **New Project**
3. Choose your organization (or create one)
4. Set:
   - **Name**: `riley-content-system`
   - **Database Password**: Generate a strong password and save it
   - **Region**: Choose closest to you
5. Click **Create new project** (takes ~2 minutes)

#### Get Your Credentials
Once the project is ready:

1. **Project URL**
   - Go to **Settings > API**
   - Copy the **Project URL** (looks like `https://xxxxx.supabase.co`)

2. **Service Role Key** (for n8n backend)
   - On the same page, copy the **service_role** key under "Project API keys"
   - ⚠️ Keep this secret - it bypasses Row Level Security

3. **Database Connection String** (for direct Postgres access)
   - Go to **Settings > Database**
   - Copy the **Connection string** (URI format)
   - Replace `[YOUR-PASSWORD]` with your database password

#### Enable pgvector Extension
1. Go to **SQL Editor** in Supabase dashboard
2. Run this SQL:
   ```sql
   create extension if not exists vector;
   ```
3. Click **Run** - you should see "Success"

#### Run the Schema Setup
1. Open `n8n/supabase-schema.sql` from this project
2. Copy the entire contents
3. Paste into Supabase SQL Editor
4. Click **Run**

### In n8n

#### Option A: Supabase Node (Recommended)
1. Go to **Settings > Credentials**
2. Click **Add Credential**
3. Search for "Supabase"
4. Enter:
   - **Host**: Your project URL (without `https://`)
   - **Service Role Key**: Your service_role key
5. Name it "Supabase"

#### Option B: PostgreSQL Node (Direct Database Access)
1. Go to **Settings > Credentials**
2. Click **Add Credential**
3. Search for "Postgres"
4. Enter your connection details from the connection string:
   - **Host**: `db.xxxxx.supabase.co`
   - **Database**: `postgres`
   - **User**: `postgres`
   - **Password**: Your database password
   - **Port**: `5432`
   - **SSL**: Enable
5. Name it "Supabase Postgres"

### Cost Estimate
- **Free tier**: 500MB database, 2GB bandwidth - handles thousands of posts
- **Pro tier**: $25/month if you exceed free limits

### Verification
After setup, test by running this in Supabase SQL Editor:
```sql
SELECT * FROM posted_content LIMIT 5;
```
Should return empty results (no errors means success).

---

## 4. OpenAI API (for Embeddings)

### Why Needed
The self-learning system uses OpenAI's `text-embedding-3-small` model to create vector embeddings for semantic search. This allows the system to:
- Find similar past content
- Avoid repetition
- Learn from successful patterns

### Setup Steps
1. Go to [OpenAI Platform](https://platform.openai.com/)
2. Sign up or log in
3. Navigate to **API keys**
4. Click **Create new secret key**
5. Copy the key (starts with `sk-`)

### In n8n
1. Go to **Settings > Credentials**
2. Click **Add Credential**
3. Search for "OpenAI"
4. Paste your API key
5. Name it "OpenAI API"

### Cost Estimate
- text-embedding-3-small: ~$0.02 per 1M tokens
- Typical weekly learning: ~10,000 tokens = ~$0.0002 (essentially free)

### Alternative: Use Anthropic
If you prefer not to use OpenAI, you can modify the learning workflow to use Anthropic for embeddings instead (requires code changes).

---

## 5. Hypefury API

### Why Needed
Schedules Twitter content automatically.

### Setup Steps
1. Go to [Hypefury](https://app.hypefury.com/)
2. Log in to your account
3. Go to **Settings > API** (may require paid plan)
4. Generate an API key
5. Copy the key

### In n8n
1. Go to **Settings > Credentials**
2. Click **Add Credential**
3. Search for "Header Auth"
4. Set:
   - Name: `Authorization`
   - Value: `Bearer YOUR_API_KEY`
5. Name it "Hypefury API"

### Note
If you don't have Hypefury API access, you can:
- Manually copy content from the review document
- Use Buffer or another scheduling tool
- Use Twitter API directly (see below)

---

## 6. Twitter API (Optional)

### Why Needed
Direct posting to Twitter without Hypefury.

### Setup Steps
1. Go to [Twitter Developer Portal](https://developer.twitter.com/)
2. Apply for **Elevated access** (required for posting)
3. Create a new App
4. Set up **OAuth 2.0** with:
   - Type: Web App
   - Callback URL: `http://localhost:5678/rest/oauth2-credential/callback`
5. Note your Client ID and Client Secret

### In n8n
1. Go to **Settings > Credentials**
2. Click **Add Credential**
3. Search for "Twitter OAuth2"
4. Enter Client ID and Client Secret
5. Click **Connect** to authorize

### Important
- Elevated access takes 1-2 days to approve
- Free tier has posting limits
- Consider Hypefury for easier setup

---

## 7. LinkedIn API (Optional - Complex)

### Why Needed
Direct posting to LinkedIn.

### Reality Check
LinkedIn API setup is complex and has limitations:
- Requires company page OR personal profile posting approval
- OAuth flow is complex
- Rate limits are strict

### Recommended Alternative
For now, use the manual approach:
1. Review document includes LinkedIn posts
2. Copy/paste to LinkedIn manually
3. Use this time to engage with the post

### If You Still Want API Access
1. Go to [LinkedIn Developers](https://www.linkedin.com/developers/)
2. Create an App
3. Request `w_member_social` scope (requires verification)
4. Set up OAuth 2.0 flow
5. Be prepared for a 2-4 week approval process

---

## Credential Security Best Practices

1. **Never commit credentials to git**
   - The `.gitignore` already excludes credential files
   - n8n stores credentials encrypted in its database

2. **Use environment variables for production**
   - Set credentials via `docker-compose.yml` environment section
   - Reference with `$ANTHROPIC_API_KEY` syntax

3. **Rotate keys regularly**
   - Set calendar reminders to rotate keys quarterly
   - Update in n8n immediately after rotation

4. **Monitor usage**
   - Check Anthropic Console for API usage
   - Set up billing alerts

---

## Testing Your Credentials

After setting up each credential:

1. **Anthropic**: Create a simple workflow with Claude node, send "Hello"
2. **Slack**: Send test message via HTTP Request node
3. **Hypefury**: Try scheduling a test post (delete after)
4. **Twitter**: Test with a simple tweet (delete after)

---

## Troubleshooting

### "Invalid API Key" Error
- Check for extra spaces when pasting
- Regenerate the key if needed
- Ensure the key has correct permissions

### "Rate Limit" Error
- Wait and retry
- Check your plan limits
- Consider upgrading or batching requests

### OAuth "Callback URL Mismatch"
- Ensure callback URL matches exactly
- Include/exclude trailing slash as needed
- Check http vs https

