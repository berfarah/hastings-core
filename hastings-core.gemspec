# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "hastings-core"
  spec.version       = "0.1.1"
  spec.authors       = ["Bernardo Farah"]
  spec.email         = ["ber@bernardo.me"]

  spec.summary       = "The bare minimum to get Hastings running"
  spec.description   = "The framework for Hastings along with some base classes"
  spec.homepage      = "http://github.com/berfarah/hastings-core"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "activesupport", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
