# frozen_string_literal: true

require 'rspec'
require_relative '../../../app/ledger'

module ExpenseTracker
  describe Ledger, :aggregate_failures, :db do
    let(:ledger) { Ledger.new }
    let(:expense) do
      {
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      }
    end

    describe '#record' do
      context 'with a valid expense' do
        it 'successfully saves the expense in the DB' do
          result = ledger.record(expense)

          expect(result).to be_success
          expect(DB[:expenses].all).to match [a_hash_including(
            id: result.expense_id,
            payee: 'Starbucks',
            amount: 5.75,
            date: Date.iso8601('2017-06-10')
          )]
        end
      end

      context 'when expense is missing payee' do
        it 'rejects the expense as invalid' do
          expense.delete('payee')
          result = ledger.record(expense)

          expect(result).not_to be_success
          expect(result.expense_id).to eq(nil)
          expect(result.error_message).to include('`payee` is required')

          expect(DB[:expenses].count).to eq(0)
        end
      end
    end

    describe '#expenses_on' do
      it 'should return all expenses for the provided date' do
        result_1 = ledger.record(expense.merge('date' => '2017-06-11'))
        result_2 = ledger.record(expense.merge('date' => '2017-06-11'))
        result_3 = ledger.record(expense.merge('date' => '2017-06-12'))

        expect(ledger.expenses_on('2017-06-11')).to contain_exactly(
                                                        a_hash_including(id: result_1.expense_id),
                                                        a_hash_including(id: result_2.expense_id)
                                                    )
        expect(ledger.expenses_on('2017-06-11')).not_to contain_exactly(a_hash_including(result_3))
      end

      it 'should return an empty array when there are no matching dates' do
        expect(ledger.expenses_on('2017-06-11')).to eq([])
      end
    end
  end
end
