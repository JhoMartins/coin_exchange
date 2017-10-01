# README

## Introduction
Making with [Fixer.io](http://fixer.io/) API. The coin-exchange API is a simple app to convert currency and show quota variation of several countries.

![Alt text](/app//assets/images/app.png?raw=true)

This application is currently online on: https://coin-exchange.herokuapp.com/

## Features
- Select currency, currency destination and value to convert with AJAX
- Alternate currency with currency destination whit icon click
- Chart with variation of the value of the current currency for the target currency

## About

This application was develop to pratic Ruby on Rails concepcts: integration with external APIs, development based on TDD, inegration with Codeship CI and automatic deploy to Heroku and introduction in Docker and Dopcker-compose.


## Getting Started

You can download or clone this repository and run the following commands:

```
1 - docker-compose build
2 - docker-compose run --rm rake db:create
3 - docker-compose run --rm rake db:migrate
4 - docker compose up
```
### TODO
- Fixes responsive layout in mobile
- Improvements in layout
- Implements JS tests with Rspec and Capybara
