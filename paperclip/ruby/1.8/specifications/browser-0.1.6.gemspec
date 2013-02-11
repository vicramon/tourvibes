# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "browser"
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nando Vieira"]
  s.date = "2013-02-10"
  s.description = "Do some browser detection with Ruby."
  s.email = ["fnando.vieira@gmail.com"]
  s.homepage = "http://github.com/fnando/browser"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Do some browser detection with Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<actionpack>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<pry-meta>, [">= 0"])
      s.add_development_dependency(%q<awesome_print>, [">= 0"])
    else
      s.add_dependency(%q<actionpack>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<pry-meta>, [">= 0"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<pry-meta>, [">= 0"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
  end
end
