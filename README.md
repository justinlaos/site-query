# README

# measurabl-

ruby "3.1.2"
rails "~> 7.0.4"

* to run app

```bundle Install```
```rails db:create```
```rails db:migrate```
```rails db:seed```
```rails s```

in a client go to [http://localhost:3000] 

Send POST to [http://localhost:3000/api/users/login?user[password]=password&user[email]=test@test.com]

Add returned token to your "Bearer token" for the following requests

Send GET to [http://localhost:3000/api/portfolios] to view portfolies for the current user

Send GET to [http://localhost:3000/api/portfolios/1/sites] to view sites for that portolio

Send GET to [http://localhost:3000/api/portfolios/1/sites/1/spaces] to view spaces for that site


* How to run the test suite
```rake db:seed RAILS_ENV=test --trace```
```rails test```
