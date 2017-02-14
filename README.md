# LUCHA Client Management System

LUCHA is an organization based in Humboldt Park that looks to forward housing as a human right and to help its client base in three ways - to stabilize their housing situation, buy a home, or save their home.

## LUCHA’s Mission:

> LUCHA (the Spanish word for “struggle”) advances housing as a human right by empowering communities - particularly the Latino and Spanish-speaking populations- through advocacy, education, affordable housing development and comprehensive housing services.

## Models

There are two Devise models: `client` and `user` (user is also interchangable with employee throughout this document).

The client has a one to one relationship with the following models - Foreclosures, Homebuyings, Law Projects, Senior Repairs, Rentals and Budgets. These models are the specific applications to those programs.

The client will only be able to create one application for a any given program area, but they can apply for any programs (ie. a client can have a foreclosure and rental application in at the same time). The Budget model is there as a tool for the client, though it is required for a foreclosure application to be considered complete.

## Application details:

* Ruby version: 2.2.2
* Rails version: 4.2.4
* This is a Postgres database
* AngularJS is used on the front end

## Installing

* `git clone https://github.com/the-difference-engine/lucha-app.git`
* `bundle`
* `rake db:create`
* `rake db:migrate`
* `bundle exec rspec`
* `rails s`

## Deployment instructions:

* QA Server: `qa` branch is continuously deployed using Codeship
* Demo Server: `git push demo demo:master`
* Prod Server: `git push prod master`

[ ![Codeship Status for the-difference-engine/lucha-app](https://app.codeship.com/projects/6c8d69f0-d15d-0134-5638-6ec8cceab435/status?branch=qa)](https://app.codeship.com/projects/201506)