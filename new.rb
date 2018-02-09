require 'selenium-webdriver'
require 'test-unit'

class FakeTest <Test::Unit::TestCase

	def setup
		@url = "http://localhost/great/"
		@drive = Selenium::WebDriver.for :firefox
		@drive.manage.timeouts.implicit_wait = 30
	end
	def test_login
		@drive.get(@url)
		username = @drive.find_element(:id, "username")
		username.send_keys("roselyne321")

		password = @drive.find_element(:id, "password")
		password.send_keys("12345678")

		login = @drive.find_element(:id,"login_btn")
		login.submit

		username = @drive.find_element(:id, "username")
		username.send_keys("Great! you are getting the hang of it!")

	end

	def teardown
		@drive.quit
		
	end



end