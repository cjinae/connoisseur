# goes out to API, consuming it and puts-ing it
# index will give us a list of all the products
require "json"
require "open-uri"

class HtmlGenerator

	# don't need to initialized because you aren't passing any arguments when you instantiate the HTMLGenerator

	def show(id)                        # if you were using class methods this would be self.show
		print_header
		puts "Action: Show"			# for testig purpose in the terminal, for set up
			
		one_product = retrieve_data("http://lcboapi.com/products/#{id}.json") 	# since we passed the ID into the show action we now have access to the id

		display_detailed_product(one_product)
		# puts products.inspect

		print_footer
	end

	def index
		print_header
		puts "Action: Index"

		products = retrieve_data("http://lcboapi.com/products.json")	# this bring all information related to each product

		products.each do |product|
			display_product(product)
		end
		# puts product.inspect 			# to test and have everything print to screen
		
		print_footer
	end

	private			# router scrip is responsible for index and show (only), it doesn't direclty need print_header or print_footer
					# router can access those through index or show
					# private methods are only going to be availble to methods in this class Html Generator, not in directly through router.
					# this is very good practice to organize and seperate what is private methods. anything below is private

	def display_detailed_product(one_product)
		puts "<h3>#{one_product['name']}</h3>"
		puts "<img src = #{one_product['image_url']}>"
		puts "<ul>"
		puts "<li>id: #{one_product['id']}</li>"
		puts "<li>#{one_product['producer_name']}</li>"
		puts "<li>#{one_product['primary_category']}</li>"
		puts "<li>#{one_product['secondary_category']}</li>"
		puts "<li>#{one_product['package_unit_volume_in_milliliters']} ml</li>"
		puts "<li>$#{one_product['price_in_cents']/100.0}</li>"
		puts "</ul>"	
	end

	def display_product(product)
		puts "<h3>#{product['name']}</h3>"
		puts "<img src = #{product['image_thumb_url']} height=200 width=200>"
		puts "<ul>"
		puts "<li><p>id: #{product['id']}</p></li>"
		puts "<li><p>#{product['producer_name']}</p></li>"
		puts "<li><p>#{product['primary_category']}</p></li>"
		puts "<li><p>#{product['secondary_category']}</p></li>"
		puts "<li><p>#{product['package_unit_volume_in_milliliters']} ml</p></li>"
		puts "<li><p>$#{product['price_in_cents']/100.0}</p></li>"
		puts "</ul>"
	end


	def print_header 				# separated so that we DRY
		puts "<html>"
		puts "	<head>"
		puts "		<title>Connoisseur</title>"
		puts "		<style>img {float:left;} ul {list-style : none;} p {color:blue;}</style>"
		puts "	</head>"
		puts "	<body>"

	end

	def print_footer
		puts "	</body>"
		puts "</html>"
	end

	 # def retrieve_data
	 #    response = open("http://lcboapi.com/products.json").read  # i can change the page (from API information) to get information on a different page
	 #    data = JSON.parse(response)
	 #    return data["result"]
	 # end

 	def retrieve_data(url)
    response = open(url).read  
    data = JSON.parse(response)
    return data["result"]
	
	end
end

























