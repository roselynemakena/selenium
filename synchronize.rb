
require 'selenium-webdriver'
require 'test-unit'

=begin
Implicit wait -> waits for a particular moment of time before retrying to find that element/perform an action

Explicit wait -> provides some conditions which must be met before proceeding with the tests

=Common conditions include:
-Element is visible and enabled
-Element is selected
-Element is present
-specific text is present in an element
-Title is present

Explicit waits are implemented with wait.until - waits for the time specified


=end


class SynchronizeTest < Test::Unit::TestCase

	def setup
		@my_driver = Selenium::WebDriver.for :firefox
		@url = "http://localhost/great/"
		
	end

	def test_implicit_wait
		@my_driver.get(@url)
		sleep(2)
		
	end

	def test_explicit_wait
		
	end

	def teardown
		@my_driver.quit
	end

end
