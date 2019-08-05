module Xeroizer
  module Record

    class BatchPaymentModel < BaseModel

      set_xml_root_name 'BatchPayments'
      set_permissions :read, :write

    end

    class BatchPayment < Base

      set_primary_key :batch_payment_id

      guid          :batch_payment_id
      date          :date
      decimal       :total_amount
      string        :type
      string        :status
      string        :reference
      datetime_utc  :updated_date_utc, :api_name => 'UpdatedDateUTC'
      boolean       :is_reconciled

      belongs_to    :account
      has_many      :payments

      def account_id
        account.id if account
      end

    end

  end
end
