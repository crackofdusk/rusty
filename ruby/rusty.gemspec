lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rusty/version'

Gem::Specification.new do |spec|
  spec.name          = 'rusty'
  spec.version       = Rusty::VERSION
  spec.authors       = ['Dimiter Petrov']
  spec.email         = ['crackofdusk@gmail.com']
  spec.summary       = %q{A toy gem with a native extension in Rust.}
  spec.description   = %q{A toy Ruby gem which contains a native extension implemented in Rust and some C glue code.}
  spec.homepage      = 'https://github.com/crackofdusk/rusty'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rake-compiler', '~> 0.9.3'

  spec.executables = 'rusty'

  spec.extensions << 'ext/rusty/extconf.rb'
end
