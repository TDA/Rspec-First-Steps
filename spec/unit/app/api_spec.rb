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

    describe 'GET /expenses' do
      let(:expense) { {'some' => 'data'} }

      context 'when expenses exist on a given date' do
        before do
          allow(ledger)
            .to receive(:expenses_on)
            .with('2017-06-12')
            .and_return(expense)
        end

        it 'returns the expense records as JSON' do
          get '/expenses/2017-06-12'

          expect(parsed_response).to eq(expense)
        end

        it 'responds with 200 (OK)' do
          get '/expenses/2017-06-12'

          expect(last_response.status).to eq(200)
        end
      end

      context 'when there are no expenses on a given date' do
        before do
          allow(ledger)
            .to receive(:expenses_on)
            .with('2017-06-14')
            .and_return([])
        end

        it 'returns an empty array as JSON' do
          get '/expenses/2017-06-14'

          expect(parsed_response).to eq([])
        end

        it 'responds with 200 (OK)' do
          get '/expenses/2017-06-14'

          expect(last_response.status).to eq(200)
        end
      end
    end
  end
end
