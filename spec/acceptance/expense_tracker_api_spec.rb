# frozen_string_literal: true

require 'rack/test'
require 'json'
require_relative '../../app/api'

module ExpenseTracker
  describe 'Expense Tracker API', :db do
    include Rack::Test::Methods

    def post_expense(expense)
      post '/expenses', JSON.generate(expense)
      expect(last_response.status).to eq(200)

      parsed_response = JSON.parse(last_response.body)
      expect(parsed_response).to include('expense_id' => a_kind_of(Integer))
      expense.merge('id' => parsed_response['expense_id'])
    end

    def app
      ExpenseTracker::API.new(ledger: Ledger.new)
    end

    it 'records submitted expenses' do
      # JSON converts to string keyed hash, so can't use symbols
      post_expense(
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      )
    end

    it 'retrieves the posted payments on a given date' do
      coffee = post_expense(
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      )
      zoo = post_expense(
        'payee' => 'Zoo',
        'amount' => 15.25,
        'date' => '2017-06-10'
      )
      grocery = post_expense(
        'payee' => 'Whole Foods LOL',
        'amount' => 95.25,
        'date' => '2017-06-11'
      )

      get '/expenses/2017-06-10'
      puts "Body #{last_response.body}"
      expect(last_response.status).to eq(200)
      expenses = JSON.parse(last_response.body)
      expect(expenses).to contain_exactly(coffee, zoo)

      get '/expenses/2017-06-11'
      expect(last_response.status).to eq(200)
      expenses = JSON.parse(last_response.body)
      expect(expenses).to contain_exactly(grocery)
    end
  end
end
