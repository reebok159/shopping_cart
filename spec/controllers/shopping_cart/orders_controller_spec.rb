require 'rails_helper'

module ShoppingCart
  RSpec.describe OrdersController, type: :controller do
    routes { ShoppingCart::Engine.routes }
    let(:user) { create(:user) }
    let(:coupon) { create(:coupon, code: 'testcoupon') }

    before(:each) do
      sign_in user
    end

    describe 'GET #index' do
      it 'open page with orders' do
        get :index
        expect(response).to have_http_status(:ok)
      end

      context 'with no auth user' do
        it 'open page with orders' do
          sign_out user
          expect{get :index}.to raise_error(CanCan::AccessDenied)
        end
      end
    end

    describe 'GET #show' do
      let(:order) { create(:order, user: user, status: :in_queue) }
      it 'open page with order' do
        get :show, params: { id: order.id }
        expect(response).to have_http_status(:ok)
      end

      context 'with no auth user' do
        it 'open page with orders' do
          sign_out user
          expect{get :show, params: { id: order.id }}.to raise_error(CanCan::AccessDenied)
        end
      end
    end

    describe 'GET #cart' do
      context 'without cart items' do
        before(:each) do
          @order = create(:order, user: user)
          get :cart
        end

        it 'select necessary order' do
          expect(assigns(:order)).to eq(@order)
        end

        it 'open cart' do
          expect(response).to have_http_status(:ok)
        end

        it 'render cart page' do
          expect(response).to render_template('cart')
        end

        it 'check cart is empty' do
          expect(assigns(:order).order_items.count).to eq 0
        end

        it 'check cart isn\'t empty' do
          cart = assigns(:order)
          order_item = create(:order_item, product: create(:product))
          cart.order_items << order_item
          cart.save
          get :cart
          expect(assigns(:order).order_items.count).not_to eq 0
        end
      end

      context 'with cart items' do
        before(:each) do
          @order = create(:order, :with_products, user: user)
          get :cart
        end

        it 'check cart isn\'t empty' do
          expect(assigns(:order).order_items.count).not_to eq 0
        end
      end
    end

    describe 'POST #activate_coupon' do
      context 'with empty cart' do
        before(:each) do
          @order = create(:order, user: user)
        end

        it 'try to activate and something happening' do
          post :activate_coupon, params: { order: { coupon_id: coupon.code } }
          expect(flash[:notice]).not_to be nil
        end

        it 'check that I cannot use coupon to empty cart' do
          post :activate_coupon, params: { order: { coupon_id: coupon.code } }
          expect(flash[:notice]).to eq I18n.t('coupon.cantactivate')
        end
      end

      context 'with cart items' do
        before(:each) do
          @order = create(:order, :with_products, user: user)
        end

        it 'show activate success' do
          post :activate_coupon, params: { order: { coupon_id: coupon.code } }
          expect(flash[:notice]).to eq I18n.t('coupon.activatesuccess')
        end

        it 'check that coupon have effect to order sum' do
          post :activate_coupon, params: { order: { coupon_id: coupon.code } }
          get :cart
          expect(assigns(:order).coupon_discount).to eq coupon.discount
        end

        it 'try activate expired coupon' do
          expired_coupon = create(:coupon, code: 'testcoupon2', expires: DateTime.now - 5.days)
          post :activate_coupon, params: { order: { coupon_id: expired_coupon.code } }
          expect(flash[:notice]).to eq I18n.t('coupon.termerror')
        end

        it 'show that order sum is not enough' do
          coupon = create(:coupon, min_sum_to_activate: @order.subtotal + 1)
          post :activate_coupon, params: { order: { coupon_id: coupon.code } }
          expect(flash[:notice]).to eq I18n.t('coupon.sumerror')
        end

        it 'show that coupon is not exist' do
          some_rand_value = '----nasdfjan213sd'
          post :activate_coupon, params: { order: { coupon_id: some_rand_value } }
          expect(flash[:notice]).to eq I18n.t('coupon.noexist')
        end
      end
    end
  end
end
