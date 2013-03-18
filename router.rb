# Access parameters passed into the app 
require_relative 'html_generator'

if ARGV.empty? # there are no arguments provided
	puts "USAGE: bla blah"
else
	puts "Yay you passed in some arguments:)"
	generator = HtmlGenerator.new			# this is the instance method approach. you could alternatively use class method

	if ARGV[0] == "index" 			# if the first argument
		generator.index

	elsif ARGV[0] == "show"			# the show action will print out a page called show.html for a product with a particular id
		id = ARGV[1]
		generator.show(id)			# pass id to show as a parameter
	else
		puts "Unrecognized action. Please refer to usage"
	end
end	

# puts ARGV[0].inspect 	# debugging method to see arguments
# puts ARGV[1].inspect
# puts ARGV[2].inspect