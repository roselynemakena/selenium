require 'selenium-webdriver'
require 'test-unit'


=begin
Advanced selenium APIs allow for drag and drop as well as mouse events - Actions class is used




=end

class ApiTest < Test::Unit::TestCase

	def setup
		@url = "http://localhost/great/"
		@my_driver = Selenium::WebDriver.for :firefox
		@my_driver.get(@url)
		@my_driver.manage.window.maximize
	end

	def element_exists?(element)
		@my_driver.find_element(:id, element)

		begin
			rescue Selenium::WebDriver::Error::NoSuchElementError
				puts "Not found :("
		end
	end


	def test_table_rows
		

		table = @my_driver.find_element(:id, "mytable")
	
		if table
			rows = table.find_elements(:tag_name, "tr")
			puts rows
			assert_equal 4, rows.size
		else
			puts "That element does not exist!"
		end

		puts "-------------Printing the ROWS now--------------------"

		rows.each_with_index do |row, no|
			td = row.find_elements(:tag_name, "td")
			puts "---------This is ROW #{no}-------------------"
			td.each do |td_text|
				puts td_text.text

			end
		end

	end

	def test_check_red
		btn_red  = @my_driver.find_element(:id, "red")

		btn_red.click
		puts "Clicked!"
		sleep(3)

		puts btn_red.is_checked

	end

	def mouse_event



		
	end

	def teardown
		@my_driver.quit

	end



end