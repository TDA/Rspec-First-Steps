require 'rack/test'
require 'json'
require_relative '../../app/api'

module ExpenseTracker
  describe 'Expense Tracker API' do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    it 'records submitted expenses' do
      # JSON converts to string keyed hash, so can't use symbols
      coffee = {
          'payee' => 'Starbucks',
          'amount' => 5.75,
          'date' => '2017-06-10'
      }

      post '/expenses', JSON.generate(coffee)
      expect(last_response.status).to eq(200)
    end
  end
end