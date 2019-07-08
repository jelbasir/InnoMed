# Dependencies

- Ruby 2.6.3
- Rails  5.1.x
- SQLite
- Redis

# Overview

For now it's demo for chat between Patients and Doctors. Consider that it uses scoped loging for them.
It uses [ActionCable](https://guides.rubyonrails.org/action_cable_overview.html) for message deliverying, review:
- app/assets/javascript/channels/*
- app/assets/channels/*

# Deployment

There is no deployment setup for now. Just go to the server.

## Staging

http://18.202.252.238

## Initial server configuration

For EC2
```
git clone git@github.com:ameenmohamed/innomed.git
# navigate to dir
bundle
# rails db:reset - it's dropping previous db use consciously
rails db:migrate
```

Install Redis:
```
sudo yum-config-manager --enable epel
sudo yum install redis
sudo redis-server /etc/redis.conf
```

# Development

## Testing

No test suite. Use rspec for develop one.

## TODOs:

- Use AnyCable
- Utilize rails credentials for saving Stripe credentials
- Setup Deployment pipeline
- Update to bootstrap 4
