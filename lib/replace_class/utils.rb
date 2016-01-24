module ReplaceClass

	##
	# filename util
	class Util

		##
		# valid file types
		VALID_FILE_TYPE = [".h", ".m", ".pbxproj",".swift"]

		##
		# ignore dirs
		IGNORE_DIR = ["Pods", "DerivedData"]

		##
		# check file if hide
		def self.hidden?(filename)
			filename =~ /^\./
		end

		##
		# check dir if ignore
		def self.check_ignore_dir(filename)
			IGNORE_DIR.find_index(filename)
		end

		##
		# check file if valid
		def self.check_valid_with_file(filename)

			if filename !~ /^\./ then

				VALID_FILE_TYPE.each do |ext|

					if File.extname(filename) == ext
						return true
					end
				end
			end
			false
		end

	end

end
