require 'selenium-webdriver'
require 'test-unit'


class OtherTest <Test::Unit::TestCase
	def setup
		@driver = Selenium::WebDriver.for :firefox
		@url = "https://www.google.com/"

		@driver.manage.timeouts.implicit_wait = 20
		
	end

	def test_one
		@driver.get(@url)
		e = @driver.find_element(:name, "q")
		
		e.clear
		e.send_keys("Afternoon")
		e.submit

		wait = Selenium::WebDriver::Wait.new(:timeout => 30)
		wait.until{@driver.title.include? "Afternoon"}
	end

	def teardown
		@driver.quit
	end
	
end