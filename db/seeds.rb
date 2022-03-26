
accounts = Account.create([{ account_number: "123456", balance: 50 }, { account_number: "7891011", balance: 150 }])

Customer.create([
    { name: "Pedro Silva", cpf: "633.301.308-06", account_id: Account.first.id },
    { name: "Leandro Silva", cpf: "434.259.387-46", account_id: Account.last.id }
])
