# frozen_string_literal: true

require 'ostruct'
class Pago
  def self.make_payment(order_id:, payment_method:, payment_details:)
    case payment_method
    when :check
      method_name = 'check'
      keys = %i[routing account]
    when :credit_card
      method_name = 'credit_card'
      keys = %i[cc_num expiration_month expiration_year]
    when :po
      method_name = 'purchase order'
      keys = [:po_num]
    else
      raise "Unknown payment_method #{payment_method}"
    end

    Rails.logger.info "Processing #{method_name}: " + detail(keys, payment_details)
    sleep 3 unless Rails.env.test?
    Rails.logger.info 'Done Processing Payment'

    OpenStruct.new succeeded?: true
  end

  private

  def self.detail(*keys, details)
    keys.map { |key| details.fetch(key).to_s }.join('/')
  end
end
