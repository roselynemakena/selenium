require 'selenium-webdriver'
require 'test-unit'


class ApiTest < Test::Unit::TestCase

	def setup
		@url = "http://localhost/great/"
		@my_driver = Selenium::WebDriver.for :firefox


	end


	def test_table_rows
		@my_driver.get(@url)
		@my_driver.manage.window.maximize
		


		
	end

	def teardown
		@my_driver.quit

	end


end