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
		element = @driver.find_element(:name, "q")

		element.clear
		element.send_keys "Once upon a time"

		element.submit()

		wait = Selenium::Webdriver::Wait::new(:timeout => 10)
		wait.until{@driver.title.include? "Once upon a time"}


		assert_equal "Once upon a time", @driver.title
	end

	def teardown
		@driver.quit
	end

end

