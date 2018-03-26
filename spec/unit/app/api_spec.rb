require 'rspec'

module ExpenseTracker
  describe API do
    describe 'POST /expenses' do
      context 'when the expense is successfully recorded' do
        it 'returns the expense id'
        it 'responds with 200 OK'
      end

      context 'when the expense fails validation' do
        it 'returns an error message'
        it 'responds with 422 Unprocessable entity'
      end
    end
  end
end
