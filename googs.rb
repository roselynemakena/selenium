require 'selenium-webdriver'

require 'test-unit'


class LetTest < Test::Unit::TestCase

def setup
	@url = "http://localhost/great/"

	@my_driver = Selenium::WebDriver.for :firefox
	@my_driver.get(@url)
	@my_driver.manage.timeouts.implicit_wait = 10



	
end

def test_login

	username = @my_driver.find_element(:id, "username")
	username.send_keys("makena@gmail.com")

	password = @my_driver.find_element(:id, "password")
	password.send_keys("Somepassword")
	
	login_btn = @my_driver.find_element(:id, "login_btn")

	login_btn.submit

	#Using xpath to get the username and passeord 

	username = @my_driver.find_element(:xpath, '//*[@id="username"]')
	username.send_keys("UsingXPATH")


end

def test_link
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