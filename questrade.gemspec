# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "questrade/version"

Gem::Specification.new do |spec|
  spec.name          = "questrade_api"
  spec.version       = Questrade::VERSION
  spec.authors       = ["Vaibhav Khaitan"]
  spec.email         = ["ishuvaibhav@gmail.com"]

  spec.summary       = "Ruby library for the Questrade API"
  spec.description   = "Questrade API Ruby Wrapper"
  spec.homepage      = "https://github.com/Vaibhav/Ruby-Questrade"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
