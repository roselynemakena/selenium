require 'selenium-webdriver'

require 'test-unit'

class SuperTest < Test::Unit::TestCase

	def setup
		@base_url = "https://www.google.com/"
		@driver = Selenium::WebDriver.for :firefox

		@driver.timeouts.manage.implicit_wait = 30
		
	end

	def test_one_search
		@driver.get(@base_url)

		element = browser.find_element(:name, 'q')
		element.clear

		element.send_keys("Once upon")

		element.submit
		wait = Selenium::WebDriver::Wait(:timeout => 30)
		wait.until{@drive.title.include? "Once upon"}




	end

	def teardown
		@driver.quit
		
	end


end