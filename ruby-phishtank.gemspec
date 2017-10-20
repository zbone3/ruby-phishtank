# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "phishtank/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby-phishtank"
  spec.version       = Phishtank::VERSION
  spec.authors       = ["Ziv Eli"]
  spec.email         = ["zbone3@gmail.com"]

  spec.summary       = "A simple phishtank.com API gem"
  spec.description   = "A straight-forward gem for accessing PhishTank's API to determine if a URL is a phishing site"
  spec.homepage      = "https://github.com/zbone3/ruby-phishtank"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "rest-client"
end
