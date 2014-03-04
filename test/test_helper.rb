ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def example_company
    Company.destroy_all
    company = Company.create

    resorts = Array.new
    PromoResort.create_for_name_for_scan_wait_seconds('A', 500)
    resorts.push(Resort.find_by_name('A'))
    PromoResort.create_for_name_for_scan_wait_seconds('B', 550)
    resorts.push(Resort.find_by_name('B'))
    NonPromoResort.create_for_name_for_scan_wait_seconds('C', 600)
    resorts.push(Resort.find_by_name('C'))
    NonPromoResort.create_for_name_for_scan_wait_seconds('D', 650)
    resorts.push(Resort.find_by_name('D'))
    NonPromoResort.create_for_name_for_scan_wait_seconds('E', 700)
    resorts.push(Resort.find_by_name('E'))
    NonPromoResort.create_for_name_for_scan_wait_seconds('F', 750)
    resorts.push(Resort.find_by_name('F'))
    NonPromoResort.create_for_name_for_scan_wait_seconds('G', 800)
    resorts.push(Resort.find_by_name('G'))

    company.resorts.push(resorts)
    company.save
    Company.first
  end
end
