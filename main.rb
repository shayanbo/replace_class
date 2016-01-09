#!/bin/usr/ruby -w

require 'pathname'

if !(ARGV.count == 0 || ARGV.count == 1)

	exit false
	return
end

if ARGV.count == 0
	src_root = Pathname.new(__FILE__).realpath
else
	src_root = ARGV[0]
end

@valid_file_type = [".h", ".m", ".pbxproj",".swift"]
@ignore_dir = ["Pods", "DerivedData"]

def hidden?(filename)
	filename =~ /^\./
end

def check_ignore_dir(filename)
	@ignore_dir.find_index(filename)
end

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
				result = line =~ /([^a-zA-Z]|^)(APOPost)[^a-zA-Z]/
				if result
					puts result
					puts "matching regex in line : #{index + 1} with line:\n#{line}"
				end
			end
		end
	end
end

checkDir(src_root)

