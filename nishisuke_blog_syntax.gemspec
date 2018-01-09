
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nishisuke_blog_syntax/version"

Gem::Specification.new do |spec|
  spec.name          = "nishisuke_blog_syntax"
  spec.version       = NishisukeBlogSyntax::VERSION
  spec.authors       = ["nishisuke"]
  spec.email         = ["nishisuke13+git@gmail.com"]

  spec.summary       = %q{This converts my own blog syntax to html.}
  spec.description   = %q{This converts my own blog syntax which looks like markdown to html.}
  spec.homepage      = "https://github.com/nishisuke/blog-syntax"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
