require 'selenium-webdriver'

require 'test-unit'

class Tables < Test::Unit::TestCase
def setup
	@my_driver = Selenium::WebDriver.for :firefox
	@url = "http://localhost/great/"

	@my_driver.manage.timeouts.implicit_wait = 30

	
end

def test_get_table

	@my_driver.get(@url)

	table = @my_driver.find_element(:id, "mytable")

	@my_driver.manage.window.maximize

	puts table

	row = @my_driver.find_element(:xpath, '//*[@id="mytable"]/tbody/tr[1]')

	row.click
	sleep(3)


	elements = @my_driver.find_element(:xpath, '//*[@id="dropdown"]')
	elements.find_element(:xpath, '//*[@id="dropdown"]/option[1]').click

	#Takefirst screenshot
	@my_driver.save_screenshot('/home/makena/screenshots/screenshot01.png')

	@my_driver.action.key_down(:control)
	elements.find_element(:xpath, '//*[@id="dropdown"]/option[2]').click

	elements.find_element(:xpath, '//*[@id="dropdown"]/option[5]').click
	@my_driver.action.key_up(:control)
	sleep(3)

# Context menu

btn = @my_driver.find_element(:id, "dropdown")
@my_driver.action.context_click(btn).perform


sleep(2)

puts "----------taking screenshot--------------"

@my_driver.save_screenshot('/home/makena/screenshots/screenshot01.png')


	
end

def teardown
	@my_driver.quit
	
end


end
