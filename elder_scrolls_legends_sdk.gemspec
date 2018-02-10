# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elder_scrolls_legends_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "elder_scrolls_legends_sdk"
  spec.version       = ElderScrollsLegends::VERSION
  spec.authors       = ["Andrew Backes"]
  spec.email         = ["backes.andrew@gmail.com"]
  spec.summary       = "Elder Scrolls: Legends SDK for https://elderscrollslegends.io"
  spec.description   = "Elder Scrolls: Legends SDK is a wrapper around the Elder Scrolls: Legends API located at https://elderscrollslegends.io"
  spec.homepage      = "https://elderscrollslegends.io"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 11.2"
  spec.add_development_dependency "minitest", "~> 5.9"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.1"
  spec.add_development_dependency "simplecov", "~> 0.14"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.6"

  spec.add_dependency "roar", "~> 1.1"
  spec.add_dependency "json", "~> 2.1"
  spec.add_dependency "multi_json", "~> 1.12"
  spec.add_dependency "multi_xml", "~> 0.6"
  spec.add_dependency "faraday_middleware", "~> 0.10"
end
