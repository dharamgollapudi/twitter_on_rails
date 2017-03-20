Twitter On Rails
================
Twitter on Rails is a `rails` based application, by which
you will be able to search for the tweets by a given search handle.

Goals:
------
- [x] Setup a public GitHub repository to host the code
- [x] Create a Rails 5.0+ application
- [x] Create an authentication layer to protect access from the general public
- [x] Setup twitter application and add the consumer key info to .env file
- [x] Consume the Twitter API to display the time & content of the last 25 tweets for any given Twitter handle
- [x] Deploy the application to Heroku (free app)

Stretch Goals:
--------------
- [x] Write specs/tests!
- [x] Cache identical API calls for ~5 mins
- [x] Parse @mentions in tweets and link those to the status pages
- [ ] Anything else cool that you can think of

Submission Guidelines:
----------------------
Create a Readme file within the repository that contains the following:
- [x] Brief walk-through of app design / choices made
- [x] Local environment setup instructions
- [x] Test suite setup/execution instructions (if applicable)
- [x] Email links of the public GitHub repo and live Heroku application to dev-challenge@stackcommerce.com

Design Choices:
---------------
- App Framework: `rails` was chosen as it is quick to setup up an MVP as well as familiarity
- CSS Framework: `bootstrap` was chosen due to its adaptation as well as familiarity
- Test Framework: `MiniTest` was chosen as it is the `rails` default, may switch to `rspec` as stretch goal
- Authentication: `devise` was chosen due to its extensibility for later use
- Twitter API: `twitter` was chosen as it is defacto standard to access Twitter API
- Autolink: `twitter-text` was chosen as it is maintained by Twitter community 
- Caching: `Rails.cache` was chosen as it is built into the framework and has a pluggable backend if need be

Local Setup:
------------
Clone the repo and install dependencies:
```
git clone https://github.com/dharamgollapudi/twitter_on_rails
cd twitter_on_rails
bundle install
```

Running the Server:
-------------------
Complete Local Setup (above)

Prepare the DB
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

Run the server by one of the following
```
bundle exec rails s
foreman start
```

Note: Before running the server, the following environment variables need to be setup in order to communicate with twitter.
- `TWITTER_CONSUMER_KEY` and 
- `TWITTER_CONSUMER_SECRET`

If you are running the server using `foreman` it is advised to set them in `.env` file.

Or you could run the server as follows:

`TWITTER_CONSUMER_KEY={your_consumer_key} TWITTER_CONSUMER_SECRET={your_consumer_secret} bundle exec rails s`

Testing:
--------
Complete Local Setup (above)

Prepare the DB
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:test:prepare
```

Run the tests
```
bundle exec rake test
```

Links:
------
Github Repo: https://github.com/dharamgollapudi/twitter_on_rails
Heroku App: https://twitter-on-rails-201703.herokuapp.com/

With the following Seed Users:
- tester@gmail.com/tester
- tester1@gmail.com/tester
- tester2@gmail.com/tester
- tester3@gmail.com/tester
- tester4@gmail.com/tester
- tester5@gmail.com/tester
- tester6@gmail.com/tester
- tester7@gmail.com/tester
- tester8@gmail.com/tester
- tester9@gmail.com/tester
