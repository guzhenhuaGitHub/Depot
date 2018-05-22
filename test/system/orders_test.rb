# frozen_string_literal: true

require 'application_system_test_case'

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order_without_pay_type = orders(:order_without_pay_type)
  end

  test 'check pay type selector' do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: @order_without_pay_type.name
    fill_in 'order_address', with: @order_without_pay_type.address
    fill_in 'order_email', with: @order_without_pay_type.email

    assert_no_selector '#order_routing_number'
    assert_no_selector '#order_credit_card_number'
    assert_no_selector '#order_po_number'

    select 'Check', from: 'pay_type'
    assert_selector '#order_routing_number'
    assert_no_selector '#order_credit_card_number'
    assert_no_selector '#order_po_number'

    select 'Credit card', from: 'pay_type'
    assert_no_selector '#order_routing_number'
    assert_selector '#order_credit_card_number'
    assert_no_selector '#order_po_number'

    select 'Purchase order', from: 'pay_type'
    assert_no_selector '#order_routing_number'
    assert_no_selector '#order_credit_card_number'
    assert_selector '#order_po_number'

  end
end
