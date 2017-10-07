#!/bin/bash

echo 'Enter the Facebook App ID: '
read FACEBOOK_ID

echo 'Enter the Facebook App Secret: '
read FACEBOOK_SECRET

echo 'Enter the GitHub App ID: '
read GITHUB_ID

echo 'Enter the GitHub App Secret: '
read GITHUB_SECRET

echo 'Enter the Google App ID: '
read GOOGLE_ID

echo 'Enter the Google App Secret: '
read GOOGLE_SECRET

echo 'Enter the Twitter App ID: '
read TWITTER_ID

echo 'Enter the Twitter App Secret: '
read TWITTER_SECRET

cp dot_env.txt .env
sed -i.bak "s|INSERT_FACEBOOK_APP_ID|$FACEBOOK_ID|g" .env
sed -i.bak "s|INSERT_FACEBOOK_APP_SECRET|$FACEBOOK_SECRET|g" .env
sed -i.bak "s|INSERT_GITHUB_APP_ID|$GITHUB_ID|g" .env
sed -i.bak "s|INSERT_GITHUB_APP_SECRET|$GITHUB_SECRET|g" .env
sed -i.bak "s|INSERT_GOOGLE_APP_ID|$GOOGLE_ID|g" .env
sed -i.bak "s|INSERT_GOOGLE_APP_SECRET|$GOOGLE_SECRET|g" .env
sed -i.bak "s|INSERT_TWITTER_APP_ID|$TWITTER_ID|g" .env
sed -i.bak "s|INSERT_TWITTER_APP_SECRET|$TWITTER_SECRET|g" .env
