require 'rails_helper'

module ShoppingCart
  RSpec.describe BillingAddress, type: :model do
    describe 'ActiveRecord associations' do
      it { is_expected.to belong_to(:billing_a) }
    end
    include_examples 'address_tests'
  end
end
