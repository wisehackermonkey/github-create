
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "github/create/version"

Gem::Specification.new do |spec|
  spec.name          = "ghcreate"
  spec.version       = Github::Create::VERSION
  spec.authors       = ["wisemonkey"]
  spec.email         = ["oranbusiness@gmail.com"]

  spec.summary       = %q{Github repository creator.}
  spec.description   = %q{Github repository creator  Creates a new repository on github.com asks for project name => repository name asks for username and password of github account generates a repository based on the name and description.}
  spec.homepage      = "https://github.com/wisehackermonkey/github-create"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = ["ghcreate"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
