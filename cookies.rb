require 'selenium-webdriver'
require 'test-unit'


class CookiesTest < Test::Unit::TestCase
	def setup
		@my_driver = Selenium::WebDriver.for :firefox
		@url = "http://localhost/great/"
		

	end

	def test_cookies
		#creating cookies
		@my_driver.get(@url)
		@my_driver.manage.add_cookie(name: "my cooks", value: "3462345tvrt2vrwgbv542vy45", path: "/", domain: "")
		@my_driver.manage.add_cookie(name: "cooki", value: "cookiekookikuki", path: "/", domain: "")

		cookies =  @my_driver.manage.all_cookies

		cookies.each_ do |cook|
			puts cook
			puts '-------------------'
		end

		
	end

	def teardown
		@my_driver.quit
		
	end

end