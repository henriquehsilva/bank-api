# spec/factories.rb

FactoryBot.define do
    factory(:account) do
      balance { Faker::Number.decimal(l_digits: 2) }
      account_number { Faker::Bank.account_number(digits: 13) }
    end
  end