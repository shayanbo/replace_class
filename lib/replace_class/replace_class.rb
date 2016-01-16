#!/usr/bin/ruby -w

require 'optparse'
require 'replace_class/utils'
require 'replace_class/option_parser'

#
# main module for this gem
#
# === Example
# ReplaceClass.start
#
module ReplaceClass

	#--
	# TODO: finish replace job
	#++
	# replace class from source to dest (include file name)
	#
	def self.start

		# option parse
        ReplaceClass::OptParser.parse do |parser, options|

        	$options = options

			# check option
			if !options.has_key?(:source) || !options.has_key?(:dest)
				puts parser.help
				exit false
			end

			# check project file when no path
			if ARGV.empty? then 
			   if Dir["*.xcodeproj"].empty? then
			       puts "current directory have not a filename end with 'xcodeproj'"
			       exit false
			   end
			end

			# perform
			if ARGV.empty? then
				src_root = File.expand_path('../', __FILE__)
			else
				src_root = File.expand_path(ARGV.last)
			end

			checkDir(src_root)
		end
	end

	#:stopdoc:

	##
	# short cut for matching string
	def self.match?(line_or_filename)
	   
	   regex = Regexp.new("([^a-zA-Z]|^)(#{$options[:source]})([^a-zA-Z]|$)")
	   line_or_filename =~ regex
	end

	##
	# traverse dir for checking replacement
	def self.checkDir(dir)

		aDir = Dir.new(dir)
		aDir.each do |filename|

			filePath = File.join(dir, filename)

			isFile = File.file?(filePath)
			isDir = File.directory?(filePath)

			if isDir 

				if !ReplaceClass::Util.hidden?(filename) && !ReplaceClass::Util.check_ignore_dir(filename)
					checkDir(filePath)
				end
			end

			if isFile

				unless ReplaceClass::Util.check_valid_with_file(filename)
					next
				end

				if ReplaceClass::Util.hidden?(filename)
					next
				end
          
	            if match?(filename)
	                puts "matching regex to file: #{filename}"
	            end

				lines = IO.readlines(filePath)
				lines.each_index do |index| 

					line = lines[index]
					if match?(line)
						puts "matching regex in line : [#{filename} : #{index + 1}] with content:\n#{line}"
					end
				end
			end
		end
	end

end