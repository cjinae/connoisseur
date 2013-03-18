# Access parameters passed into the app 
require_relative 'html_generator'

if ARGV.empty? # there are no arguments provided
	puts "USAGE: bla blah"
else
	puts "Yay you passed in some arguments:)"
	generator = HTMLGenerator.new			# this is instance method. 

	if ARGV[0] == "index"
		generator.index

	elsif ARGV[0] == "show"
		generator.show
	else
		puts "Unrecognized action. Please refer to usage"
end	

# puts ARGV[0].inspect 	# arguments
# puts ARGV[1].inspect
# puts ARGV[2].inspect