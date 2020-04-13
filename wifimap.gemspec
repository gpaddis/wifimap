# frozen_string_literal: true

require_relative 'lib/wifimap/version'

Gem::Specification.new do |spec|
  spec.name          = 'wifimap'
  spec.version       = Wifimap::VERSION
  spec.authors       = ['Gianpiero Addis']
  spec.email         = ['gianpiero.addis@gmail.com']

  spec.summary       = 'Parse wifi sniffer dump files to consistent objects.'
  spec.homepage      = 'https://github.com/gpaddis/wifimap'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/gpaddis/wifimap'
  spec.metadata['changelog_uri'] = 'https://github.com/gpaddis/wifimap/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'louis'
end
