require 'selenium-webdriver'
require 'test-unit'



class WindowTest < Test::Unit::TestCase

	def setup
		@driver = Selenium::WebDriver.for :firefox
		@url = 'http://www.google.com'

		wait = @driver.manage.timeouts.implicit_wait = 10
		
	end

	def teardown
		@driver.quit
		
	end


	def test_window_switching
		@driver.get(@url)
		search_box = @driver.find_element(:name, 'q')
		search_box.send_keys("great")
		sleep(2)

		# open new window
		@driver.execute_script('window.open()')

		# Switch to new window
		@driver.switch_to.window(@driver.window_handles.last)
		@driver.get('http://www.google.com' )

		search_box = @driver.find_element(:name, 'q')
		search_box.send_keys("rick and morty")
		sleep(2)


		@driver.switch_to.window(@driver.window_handles.first)
		sleep(5)
		search_box = @driver.find_element(:name, 'q')
		search_box.clear
		search_box.send_keys("redis")


		


		# @driver.quit




		# i = 0
		# handles = @driver.window.window_handles

		# puts handles
	end



end