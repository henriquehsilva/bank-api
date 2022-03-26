class Account < ApplicationRecord

    validate :account_has_negative_balance

    def deposit(deposit_value)
        rate = deposit_value * ENV['RATE_DEPOSIT'].to_d
        deposit_value_with_rate = deposit_value - rate
        self.balance = self.balance + deposit_value_with_rate
        self.releases << "+#{deposit_value.to_s}"
    end

    def take_out(take_out_value)
        take_out_value_with_rate = take_out_value + ENV['RATE_TAKE_OUT'].to_d
        self.balance = self.balance - take_out_value_with_rate
        self.releases << "-#{take_out_value.to_s}"
    end

    def transfer(transfer_value, destinity_account)
        transfer_value_with_rate = transfer_value + ENV['RATE_TRANSFER'].to_d
        self.balance = self.balance - transfer_value_with_rate
        destinity_account.balance += transfer_value
        self.releases << "-#{transfer_value.to_s}"
        destinity_account.releases << "+#{transfer_value.to_s}"
    end

    private

    def account_has_negative_balance
        if self.balance <= 0            
            self.errors.add(:balance, "Account is not can't be has negative")
        end
    end
end
