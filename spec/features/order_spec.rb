describe 'Actions with order', type: :feature do
  before :each do
    @product = create(:product, price: 11)
    create(:user, email: 'tsets@ss.ss', password: '12345678q')
    login('tsets@ss.ss', '12345678q')
  end

  context 'adding item to cart' do
    context 'from product page' do
      before :each do
        visit product_path(@product)
      end

      it 'add item' do
        click_button 'ToCart'
        expect(page).to have_content I18n.t('order_item.create_success')
      end

      it 'add 3 items' do
        myval = 3
        find("form.egn_book_cart [name='order_item[quantity]']").set(myval)
        click_button 'ToCart'
        visit shopping_cart.cart_page_path
        total_price = @product.price * myval
        expect(first('.container').text).to have_content total_price
      end
    end
  end

  describe 'cart' do
    before :each do
      visit product_path(@product)
      click_button 'ToCart'
      create(:coupon, code: 'testcoupon', discount: 1.5)
    end

    context 'coupon' do
      it 'activate' do
        visit shopping_cart.cart_page_path
        fill_in 'order[coupon_id]', with: 'testcoupon'
        click_button I18n.t('cart.coupon.updcart')
        visit shopping_cart.cart_page_path
        total_price = @product.price - 1.5
        expect(first('.container').text).to have_content total_price
      end
    end
  end
end
