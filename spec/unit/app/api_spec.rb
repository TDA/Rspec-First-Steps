require 'rspec'
require_relative '../../../app/api'
require 'rack/test'

module ExpenseTracker
  describe API do
    include Rack::Test::Methods

    let(:ledger) { instance_double('ExpenseTracker::Ledger') }

    def parsed_response
      JSON.parse(last_response.body)
    end

    def app
      API.new(ledger: ledger)
    end

    describe 'POST /expenses' do
      context 'when the expense is successfully recorded' do
        let(:expense) { {'some' => 'data'} }

        before do
          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(true, 417, nil))
        end

        it 'returns the expense id' do
          post '/expenses', JSON.generate(expense)

          expect(parsed_response).to include('expense_id' => 417)
        end

        it 'responds with 200 (OK)' do
          post '/expenses', JSON.generate(expense)

          expect(last_response.status).to eq(200)
        end
      end

      context 'when the expense fails validation' do
        let(:expense) { {'some' => 'data'} }

        before do
          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(false, 417, 'Incomplete expense'))
        end

        it 'returns an error message' do
          post '/expenses', JSON.generate(expense)

          expect(parsed_response).to include('error_message' => 'Incomplete expense')
        end

        it 'responds with 422 Unprocessable entity' do
          post '/expenses', JSON.generate(expense)

          expect(last_response.status).to eq(422)
        end
      end
    end
  end
end
