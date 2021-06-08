# frozen_string_literal: true

require_relative 'lib/legion/logging/version'

Gem::Specification.new do |spec|
  spec.name = 'legion-logging'
  spec.version       = Legion::Logging::VERSION
  spec.authors       = ['Esity']
  spec.email         = %w[matthewdiverson@gmail.com ruby@optum.com]

  spec.summary       = 'The logging class that the LegionIO framework uses'
  spec.description   = 'A logging class used by the LegionIO framework'
  spec.homepage      = 'https://github.com/Optum/legion-logging'
  spec.license       = 'Apache-2.0'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4'
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files        = spec.files.select { |p| p =~ %r{^test/.*_test.rb} }
  spec.extra_rdoc_files  = %w[README.md LICENSE CHANGELOG.md]
  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/Optum/legion-logging/issues',
    'changelog_uri' => 'https://github.com/Optum/legion-logging/src/main/CHANGELOG.md',
    'documentation_uri' => 'https://github.com/Optum/legion-logging',
    'homepage_uri' => 'https://github.com/Optum/LegionIO',
    'source_code_uri' => 'https://github.com/Optum/legion-logging',
    'wiki_uri' => 'https://github.com/Optum/legion-logging/wiki'
  }

  spec.add_dependency 'rainbow', '~> 3'
end
