require 'rspec'
require_relative '../../../app/api'
require 'rack/test'

module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)
  describe API do
    include Rack::Test::Methods

    let(:ledger) { instance_double('ExpenseTracker::Ledger') }

    def app
      API.new(ledger: ledger)
    end

    describe 'POST /expenses' do
      context 'when the expense is successfully recorded' do
        it 'returns the expense id' do
          expense = { 'some' => 'data' }

          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(true, 417, nil))

          post '/expenses', JSON.generate(expense)

          parsed_response = JSON.parse(last_response.body)
          expect(parsed_response).to include('expense_id' => 417)
        end

        it 'responds with 200 OK'
      end

      context 'when the expense fails validation' do
        it 'returns an error message'
        it 'responds with 422 Unprocessable entity'
      end
    end
  end
end
