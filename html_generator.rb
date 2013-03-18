# goes out to API, consuming it and puts-ing it

class HtmlGenerator

	# don't need to initialized because you aren't passing any arguments when you instantiate the HTMLGenerator

	def show                          	# if you were using class methods this would be self.show
		print_header
		puts "Action: Show"			# for testig purpose in the terminal, for set up
		print_footer
	end

	def index
		print_header
		puts "Action: Index"
		print_footer
	end

	def print_header 				# separated so that we DRY
		puts "<html>"
		puts "	<head>"
		puts "		<title>Connoisseur in the head</title>"
		puts "	</head>"
		puts "	<body>"
	end

	def print_footer
		puts "	</body>"
		puts "</html>"
	end

end
