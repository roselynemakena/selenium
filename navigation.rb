require 'selenium-webdriver'
require 'test-unit'


class CookiesTest < Test::Unit::TestCase
	def setup
		@my_driver = Selenium::WebDriver.for :firefox
		@url = "https://www.google.com/"
		

	end

	def test_navigate
		#creating cookies
		@my_driver.get(@url)
		
		search_box = @my_driver.find_element(:name, "q")
		search_box.clear
		search_box.send_keys("selenium ruby")

		search_box.submit

		link = @my_driver.find_element(:link, "Ruby Bindings · SeleniumHQ/selenium Wiki · GitHub")
		link.click

		wait = Selenium::WebDriver::Wait::new(:timeout => 5)
		wait.until{@my_driver.title.include? "Ruby Bindings · SeleniumHQ/selenium Wiki"}

		sleep(3)

		@my_driver.execute_script("window.history.go(-1)")



		
	end

	def teardown
		@my_driver.quit
		
	end

end