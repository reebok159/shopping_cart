module FeatureHelper
  def login(email, password)
    visit new_user_session_path
    #first(:link, 'Log In').click
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button 'Log in'
  end

  def fill_address_form(type, data)
    fill_in "order[#{type}_address_attributes][first_name]", with: data[:first_name]
    fill_in "order[#{type}_address_attributes][last_name]", with: data[:last_name]
    fill_in "order[#{type}_address_attributes][address]", with: data[:address]
    fill_in "order[#{type}_address_attributes][city]", with: data[:city]
    fill_in "order[#{type}_address_attributes][zip]", with: data[:zip]
    page.select data[:country], from: "order[#{type}_address_attributes][country]"
    fill_in "order[#{type}_address_attributes][phone]", with: data[:phone]
  end

  def fill_card_form(data)
    fill_in 'order[credit_card_attributes][number]', with: data[:number]
    fill_in 'order[credit_card_attributes][expires]', with: data[:expires]
    fill_in 'order[credit_card_attributes][name]', with: data[:name]
    fill_in 'order[credit_card_attributes][cvv]', with: data[:cvv]
  end

  def check_content_address_step
    expect(page).to have_content I18n.t('checkout.address.billaddress')
  end

  def check_content_delivery_step
    expect(page).to have_content I18n.t('checkout.delivery.dmethod')
  end

  def check_content_card_step
    expect(page).to have_content I18n.t('checkout.payment.creditcard')
  end

  def check_content_confirm_step
    expect(page).to have_content I18n.t('checkout.address.shaddress')
    expect(page).to have_content I18n.t('checkout.address.billaddress')
    expect(page).to have_content I18n.t('checkout.confirm.shipments')
    expect(page).to have_content I18n.t('checkout.confirm.paymentinfo')
    expect(page).to have_content I18n.t('checkout.confirm.edit')
  end

  def check_content_complete_thanks(email)
    expect(page).to have_content I18n.t('checkout.thanks')
    expect(page).to have_content I18n.t('checkout.thanks2', email: email)
  end
end
