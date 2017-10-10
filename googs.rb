require 'selenium-webdriver'

require 'test-unit'


class LetTest < Test::Unit::TestCase

def setup
	@url = "http://localhost/great/"

	@my_driver = Selenium::WebDriver.for :firefox
	@my_driver.get(@url)
	@my_driver.manage.timeouts.implicit_wait = 10



	
end
def waiting_time

	wait = Selenium::WebDriver::Wait.new(:timeout => 7)

	
end

def test_login

	omit("Skip login test")

	username = @my_driver.find_element(:id, "username")
	username.send_keys("makena@gmail.com")

	password = @my_driver.find_element(:id, "password")
	password.send_keys("Somepassword")
	
	login_btn = @my_driver.find_element(:id, "login_btn")

	login_btn.submit
	waiting_time

	#Using xpath to get the username and passeord 

	username = @my_driver.find_element(:xpath, '//*[@id="username"]')
	username.send_keys("UsingXPATH")
	login_btn = @my_driver.find_element(:id, "login_btn")
	
	login_btn.submit

	waiting_time

	# Using an absolute path to obtain an element

	# username = @my_driver.find_element(:css, "html > body > nav > div >ul >li >a")
	# username.send_keys("Okay CSS is tricky")

	# Using a css selector to select elements




end

def test_radio_links
	green_radio = @my_driver.find_element(:id, "green")
	green_radio.click

	red_radio = @my_driver.find_element(:id, "red")
	puts red_radio.text

	green_radio = @my_driver.find_element(:xpath, '//*[@value="green"]')
	green_radio.click

	red_radio.click	

	# assertEquals("green", red_radio.text)
	# assert_equal "green",green_radio.text

	puts "I can print"
	@my_driver.manage.window.maximize

	# Printing the values of the drop down menu
	drop_down = @my_driver.find_element(:id, "dropdown_btn")

	puts dropdown.options
	dropdown.click


end

def test_link
	omit("Skipping test")
=begin
There are different finders - used to search for elements

*:name
*:id
*:link
*:link_text
*:partial_link_text
*:css
*:xpath
*:class
*:class_name
*:tag_name

=end

	# Find the link by it's text

	link = @my_driver.find_element(:link, "Some link")


	wait = Selenium::WebDriver::Wait.new(:timeout => 20)
	wait.until{@my_driver.title.include? "Login Page"}
	link.click


	google_page = @my_driver.find_element(:name, "q")
	google_page.clear
	google_page.send_keys("Roselyne")

	google_page.submit







	
end

def teardown
	@my_driver.quit
end

end