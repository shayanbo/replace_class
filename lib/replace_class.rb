
lib = File.expand_path('../',__FILE__)
lib = $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'replace_class/replace_class'
ReplaceClass.start