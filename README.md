# BANK-API

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.1.0](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [7.0.1](https://github.com/organization/project-name/blob/master/Gemfile#L12)

##### 1. Check out the repository

```bash
git clone git@github.com:henriquehsilva/bank-api.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

##### 5. Routes

```ruby
Rails.application.routes.draw do
  
  put 'deposit/:account_number/:value', to: 'accounts#deposit', as: 'deposit'
  put 'take_out/:account_number/:value', to: 'accounts#take_out', as: 'take_out'
  put 'transfer/:account_number/:destinity_account_number/:value', to: 'accounts#transfer', as: 'transfer'
  get 'releases/:account_number', to: 'accounts#releases', as: 'releases'
end
```

##### 6. Specs

Run the following commands.

```bash
rspec

```
