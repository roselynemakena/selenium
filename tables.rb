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

	puts table


	if table.displayed?
	trs = table.find_elements(:tag_name, "tr")

		trs.each_with_index do |tr, pos|
			puts "-----------TR No #{pos}---------------"
			tds = tr.find_elements(:tag_name, "td")
				tds.each_with_index do |td, pos|
			puts "-TD No #{pos}-"

					puts td.text
				end


		end
	end
	
end

def teardown
	@my_driver.quit
	
end


end
