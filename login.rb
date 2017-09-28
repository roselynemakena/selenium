require 'selenium-webdriver'
require 'test-unit'


class LoginTest < Test::Unit::TestCase

	def setup
		driver_00 = Selenium::WebDriver.for :firefox
		@url_ = "https://www.google.com/"
		@driver_00.manage.timeouts.implicit_wait = 30

	end

	def search_name


		
	end


end
