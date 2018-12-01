
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dzero/version"

Gem::Specification.new do |spec|
  spec.name          = "dzero"
  spec.version       = DZero::VERSION
  spec.authors       = ["Austin"]
  spec.email         = ["austin.pivarnik@instacart.com"]

  spec.summary       = "Parse and serialize NCPDP D0 messages"
  spec.description   = "NCPDP Telecommunications Standard D0 format serializer / parser"
  spec.homepage      = "https://github.com/apiv/dzero"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir['README.md', 'lib/**/*']

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 4.2'
  spec.add_dependency "classy_hash", "~> 0.2.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "factory_bot", "~> 4.11.1"
  spec.add_development_dependency "pry", "~> 0.10.4"
end
