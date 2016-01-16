# -*- encoding: utf-8 -*-
# stub: replace_class 1.0.0 ruby lib

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'replace_class/version.rb'

Gem::Specification.new do |s|
  s.name = "replace_class"
  s.version = ReplaceClass::VERSION
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.authors = ["MickeyHub"]
  s.date = Time.now.strftime("%Y-%m-%d")
  s.files = `git ls-files`.split($/)
  s.email = ["791331313@qq.com"]
  s.homepage = "http://github.com/MickeyHub/ReplaceClassName"
  s.licenses = ["MIT"]
  s.summary = "An Neat Script to Replace Class Name Globally for Xcode"
  s.description = "easy way to replace class name in xcode using ruby"
  s.executables = s.files.grep(%(^bin/))
end
