module ReplaceClass

	##
	# wrapper for built-in OptionParser
	class OptParser

		##
		# start parse options
		def self.parse # :yield: parser, cli_opts

			unless block_given? then
				exit false
			end

			options = {}
			parser = OptionParser.new do |opt|

				opt.banner = "Usage: [update_name -s source -d dest path]"

				opt.on('-s', '--source sourceClass', 'Source class name for replacement') do |value|
					options[:source] = value
				end

				opt.on('-d', '--dest destClass', 'Dest class name for replacement') do |value|
					options[:dest] = value
				end

				opt.on('-f', '--force', 'No interaction with user') do |value|
					options[:force] = value
				end

				opt.on('-y', '--yes', 'Same to force option') do |value|
					options[:force] = value
				end

			end

			parser.parse!

			yield parser, options

		end

	end

end