class AccountsController < ApplicationController

    before_action :set_account, only: [:deposit, :take_out, :transfer]
    before_action :set_value, only: [:deposit, :take_out, :transfer]
    before_action :set_destinity_account, only: [:transfer]

    def deposit
        @account.deposit(get_value)
        if @account.save
            render json: { balance: @account.balance }
        else
            render json: { errors: @account.errors.messages }, status: 422
        end
    end

    def take_out
        @account.take_out(@value)
        if @account.save
            render json: { balance: @account.balance }
        else
            render json: { errors: @account.errors.messages }, status: 422
        end
    end

    def transfer
        @account.transfer(@value, @destinity_account)
        if @account.save && @destinity_account.save
            render json: { balance: @account.balance }
        else
            render json: { errors: @account.errors.messages }, status: 422
        end
    end

    def releases
        render json: { releases: @account.releases }
    end

    private

    def set_account
        @account = Account.find_by(account_number: params[:account_number])
    end

    def set_destinity_account
        @destinity_account = Account.find_by(account_number: params[:destinity_account_number])
    end

    def set_value
        @value = params[:value].to_d
    end
end
