require 'rails_helper'

module ShoppingCart
  RSpec.describe ShippingAddress, type: :model do
    describe 'ActiveRecord associations' do
      it { is_expected.to belong_to(:shipping_a) }
    end

    include_examples 'address_tests'
  end
end
