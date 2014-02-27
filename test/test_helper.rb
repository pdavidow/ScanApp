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
    #resorts.push(PromoSkiResort.new('A', 500))
    #resorts.push(PromoSkiResort.new('B', 550))
    #resorts.push(NonPromoSkiResort.new('C', 600))
    #resorts.push(NonPromoSkiResort.new('D', 650))
    #resorts.push(NonPromoSkiResort.new('E', 700))
    #resorts.push(NonPromoSkiResort.new('F', 750))
    #resorts.push(NonPromoSkiResort.new('G', 800))
    #SkiResortCompany.new(resorts)

    resorts = Array.new
    resort = PromoSkiResort.new
    resort.name = 'A'
    resort.scan_wait_seconds = 500
    resorts.push(resort)
    resort = PromoSkiResort.new
    resort.name = 'B'
    resort.scan_wait_seconds = 550
    resorts.push(resort)
    resort = NonPromoSkiResort.new
    resort.name = 'C'
    resort.scan_wait_seconds = 600
    resorts.push(resort)
    resort = NonPromoSkiResort.new
    resort.name = 'D'
    resort.scan_wait_seconds = 650
    resorts.push(resort)
    resort = NonPromoSkiResort.new
    resort.name = 'E'
    resort.scan_wait_seconds = 700
    resorts.push(resort)
    resort = NonPromoSkiResort.new
    resort.name = 'F'
    resort.scan_wait_seconds = 750
    resorts.push(resort)
    resort = NonPromoSkiResort.new
    resort.name = 'G'
    resort.scan_wait_seconds = 800
    resorts.push(resort)
    company = SkiResortCompany.new
    company.resorts = resorts
    company
  end
end
