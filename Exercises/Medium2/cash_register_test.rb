require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(0)
    @duck = Transaction.new(300)
  end

  def test_accept_money
    setup
    @duck.amount_paid = 30
    previous_amount = @register.total_money
    @register.accept_money(@duck)
    assert_equal(previous_amount + @duck.amount_paid, @register.total_money)
  end

  def test_change
    setup
    @duck.amount_paid = 30
    previous_item_cost = @duck.item_cost
    amount_left = @register.change(@duck)
    assert_equal(amount_left, @duck.amount_paid - @duck.item_cost)
  end

  def test_give_receipt
    setup
    assert_output("You've paid $#{@duck.item_cost}.\n") do 
      @register.give_receipt(@duck)
    end
  end
end