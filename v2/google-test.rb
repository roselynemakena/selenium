require 'selenium-webdriver'
require 'test-unit'

class GoogleTest < Test::Unit::TestCase

	def setup
		@driver = Selenium::WebDriver.for :firefox
		@url = "https://www.google.com/"
		@driver.manage.timeouts.implicit_wait = 30
		
	end

	def test_google_search
		@driver.get(@url)
		@query_box = @driver.find_element(:name, 'q')
		@query_box.send_keys("Selenium webdriver")
		@query_box.submit

		

		
	end

	def teardown
		@driver.quit
		
	end


end