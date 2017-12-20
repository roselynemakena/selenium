require 'selenium-webdriver'

require 'test-unit'


class LoggerTest < Test::Unit::TestCase

def setup
	@drive = Selenium::WebDriver.for :firefox
	@url = "https://google.com/"
	
end

def test_my_name
	element = @driver.find_element(:name, "q")

	element.clear
	element.send_keys("Wasup")
	element.submit


	wait = Selenium::WebDriver::Wait.new(:timeout => 30)
	wait.until{@drive.title.include? "Wasup - Google Search"}


	assert_equal "Wasup - Google Search", @drive.title
	
end


end