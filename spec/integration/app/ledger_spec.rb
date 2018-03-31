require 'rspec'
require_relative '../../../app/ledger'
require_relative '../../../config/sequel'
require_relative '../../support/db'

module ExpenseTracker
  describe Ledger do
    let(:ledger) { Ledger.new }
    let(:expense) do {
      'payee' => 'Starbucks',
      'amount' => 5.75,
      'date' => '2017-06-10'
    }
    end

    describe '#record' do

      it 'should do something' do

        true.should == false
      end
    end
  end
end