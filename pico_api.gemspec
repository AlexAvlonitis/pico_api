# frozen_string_literal: true

require_relative 'lib/pico_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'pico_api'
  spec.version       = PicoApi::VERSION
  spec.authors       = ['Alex Avlonitis']

  spec.summary       = 'A tiny Rack-based ruby template for APIs'
  spec.description   = 'A tiny Rack-based ruby template for APIs'
  spec.homepage      = 'https://github.com/alexavlonitis/pico_api'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.executables << 'pico_api'

  spec.add_runtime_dependency 'erb', '~> 2'
  spec.add_runtime_dependency 'jsonapi-serializer', '~> 2'
  spec.add_runtime_dependency 'rackup', '~> 0.2'
  spec.add_runtime_dependency 'rake', '~> 13'
  spec.add_runtime_dependency 'roda', '~> 3'
  spec.add_runtime_dependency 'rom', '~> 5'
  spec.add_runtime_dependency 'rom-sql', '~> 3.5'
  spec.add_runtime_dependency 'zeitwerk', '~> 2.6'
end
