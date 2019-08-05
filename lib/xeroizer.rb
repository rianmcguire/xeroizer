require 'rubygems'
require 'date'
require 'forwardable'
require 'active_support/inflector'
require "active_support/core_ext/array"
require "active_support/core_ext/big_decimal/conversions"
require 'oauth'
require 'oauth/signature/rsa/sha1'
require 'nokogiri'
require 'builder'
require 'time'
require 'bigdecimal'
require 'cgi'

$: << File.expand_path(File.dirname(__FILE__))

require 'class_level_inheritable_attributes'
require 'xeroizer/oauth'
require 'xeroizer/scopes'
require 'xeroizer/http_encoding_helper'
require 'xeroizer/http'
require 'xeroizer/exceptions'

require 'xeroizer/record/base_model'
require 'xeroizer/record/payroll_base_model'
require 'xeroizer/record/payroll_array_base_model'
require 'xeroizer/record/base'
require 'xeroizer/record/payroll_base'
require 'xeroizer/record/payroll_array_base'
require 'xeroizer/configuration'

# Include models
['account','address','allocation','branding_theme','bank_transaction','bank_account','batch_payment','contact','contact_group',
  'credit_note','currency','employee','invoice','item','item_purchase_details','item_sales_details',
  'journal','journal_line','line_item','manual_journal','manual_journal_line','option','organisation',
  'payment','phone','tax_rate','tracking_category','tracking_category_child',
  'journal_line_tracking_category', 'user'].each do |model|
    require "xeroizer/models/#{model}"
end

# Include payroll models
['home_address', 'bank_account', 'employee', 'employee_leave_type', 'timesheet', 'timesheet_line', 'number_of_unit',
  'leave_application', 'leave', 'leave_period', 'period', 'pay_items', 'deduction_type', 'earnings_rate',
  'reimbursement_type', 'leave_type', 'payroll_calendar', 'pay_template', 'super_membership',
  'leave_line', 'reimbursement_line', 'super_line', 'deduction_line', 'earnings_line', 'opening_balance',
  'pay_run', 'settings', 'tracking_categories', 'employee_groups', 'timesheet_categories', 'account',
  'tax_declaration', 'payslip', 'timesheet_earnings_line', 'tax_line', 'leave_accrual_line', 'superannuation_line',
  'leave_balance', 'time_off_balance', 'earnings_type', 'super_fund', 'earning_template', 'salary_and_wages'].each do |payroll_model|
    require "xeroizer/models/payroll/#{payroll_model}"
end

require 'xeroizer/models/account'
require 'xeroizer/models/address'
require 'xeroizer/models/allocation'
require 'xeroizer/models/branding_theme'
require 'xeroizer/models/bank_transaction'
require 'xeroizer/models/bank_account'
require 'xeroizer/models/contact'
require 'xeroizer/models/contact_group'
require 'xeroizer/models/credit_note'
require 'xeroizer/models/currency'
require 'xeroizer/models/employee'
require 'xeroizer/models/expense_claim'
require 'xeroizer/models/invoice'
require 'xeroizer/models/item'
require 'xeroizer/models/item_purchase_details'
require 'xeroizer/models/item_sales_details'
require 'xeroizer/models/journal'
require 'xeroizer/models/journal_line'
require 'xeroizer/models/line_item'
require 'xeroizer/models/manual_journal'
require 'xeroizer/models/manual_journal_line'
require 'xeroizer/models/option'
require 'xeroizer/models/organisation'
require 'xeroizer/models/payment'
require 'xeroizer/models/prepayment'
require 'xeroizer/models/phone'
require 'xeroizer/models/purchase_order'
require 'xeroizer/models/receipt'
require 'xeroizer/models/repeating_invoice'
require 'xeroizer/models/schedule'
require 'xeroizer/models/tax_rate'
require 'xeroizer/models/tax_component'
require 'xeroizer/models/tracking_category'
require 'xeroizer/models/tracking_category_child'
require 'xeroizer/models/user'
require 'xeroizer/models/journal_line_tracking_category'
require 'xeroizer/models/contact_sales_tracking_category'
require 'xeroizer/models/contact_purchases_tracking_category'

require 'xeroizer/report/factory'

require 'xeroizer/response'

require 'xeroizer/generic_application'
require 'xeroizer/public_application'
require 'xeroizer/private_application'
require 'xeroizer/partner_application'
require 'xeroizer/payroll_application'
