# How to run the app

## Prerequisites
- `ruby 3.1.3`
- `rails 6.1.7`
- `postgresql 14.0`
- Slack
  - Create a slack app
  - Create a `chat:write` bot token scope in the app
  - Integrate the app with your workspace
  - Invite the app bot into the channel you want the spam notification go to

## Environment variables
Create a `.env` file in the root directory of the project and add the following environment variables:
```
SLACK_BOT_TOKEN=xoxb-xxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxx
SLACK_CHANNEL_ID=CXXXXXXXXX
SLACK_API_BASE_URL=https://slack.com/api
SLACK_POST_MESSAGE_ENDPOINT=chat.postMessage
```
## Setup
1. `bundle`
2. `rails db:create`
3. `rails generate delayed_job:active_record`
4. `rails db:migrate`

## Run
1. In one terminal, run `rake jobs:work`
3. In another terminal, run `rails s`

## What's missing/TODO
1. Tests
2. Authentication