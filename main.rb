#!/bin/usr/ruby -w

require 'pathname'
require 'optparse'

# option parse
@options = {}
@parser = OptionParser.new do |opt|

	opt.banner = "Usage: [update_name -s source -d dest path]"

	opt.on('-s', '--source sourceClass', 'Source class name for replacement') do |value|
		@options[:source] = value
	end

	opt.on('-d', '--dest destClass', 'Dest class name for replacement') do |value|
		@options[:dest] = value
	end

	opt.on('-f', '--force', 'No interaction with user') do |value|
		@options[:force] = value
	end

	opt.on('-y', '--yes', 'Same to force option') do |value|
		@options[:force] = value
	end

end

@parser.parse!

# check option
if !@options.has_key?(:source) || !@options.has_key?(:dest) 
	puts @parser.help
	exit false
end

# define
@valid_file_type = [".h", ".m", ".pbxproj",".swift"]
@ignore_dir = ["Pods", "DerivedData"]

# check file if hide
def hidden?(filename)
	filename =~ /^\./
end

# check dir if ignore
def check_ignore_dir(filename)
	@ignore_dir.find_index(filename)
end

# check file if valid
def check_valid_with_file(filename)

	if filename !~ /^\./ then

		@valid_file_type.each do |ext|

			if File.extname(filename) == ext
				return true
			end
			
		end
	end
	false

end

# main function
def checkDir(dir)

	aDir = Dir.new(dir)
	aDir.each do |filename|

		filePath = File.join(dir, filename)

		isFile = File.file?(filePath)
		isDir = File.directory?(filePath)

		if isDir 

			if !hidden?(filename) && !check_ignore_dir(filename)
				checkDir(filePath)
			end
		end

		if isFile

			if !check_valid_with_file(filename)
				next
			end

			if hidden?(filename)
				next
			end

			puts "####### #{filename} ###########"
			lines = IO.readlines(filePath)
			lines.each_index do |index| 

				line = lines[index]
                regex = Regexp.new("([^a-zA-Z]|^)(#{@options[:source]})([^a-zA-Z]|$)")
				result = line =~ regex
				if result

					puts "matching regex in line : #{index + 1} with line:\n#{line}"
				end
			end
		end
	end
end

# perform
src_root = Pathname.new(ARGV.count == 4 ? __FILE__ : ARGV.last).realpath
checkDir(src_root)

