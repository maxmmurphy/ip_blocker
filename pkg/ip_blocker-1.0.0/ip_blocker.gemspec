# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ip_blocker"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Max M. Murphy"]
  s.date = "2011-12-08"
  s.description = "Block ip addresses in middleware"
  s.email = "max@maxmurphy.net"
  s.extra_rdoc_files = ["README.rdoc", "lib/ip_blocker.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/ip_blocker.rb", "test/ip_blocker_test.rb", "Manifest", "ip_blocker.gemspec"]
  s.homepage = "http://github.com/maxmmurphy/ip_blocker"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ip_blocker", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "ip_blocker"
  s.rubygems_version = "1.8.10"
  s.summary = "Block ip addresses in middleware"
  s.test_files = ["test/ip_blocker_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
