# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cocaine}
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jon Yurek"]
  s.date = %q{2012-10-19}
  s.description = %q{A small library for doing (command) lines}
  s.email = %q{jyurek@thoughtbot.com}
  s.files = [".gitignore", ".travis.yml", "GOALS", "Gemfile", "LICENSE", "NEWS.md", "README.md", "Rakefile", "cocaine.gemspec", "lib/cocaine.rb", "lib/cocaine/command_line.rb", "lib/cocaine/command_line/runners.rb", "lib/cocaine/command_line/runners/backticks_runner.rb", "lib/cocaine/command_line/runners/fake_runner.rb", "lib/cocaine/command_line/runners/posix_runner.rb", "lib/cocaine/command_line/runners/process_runner.rb", "lib/cocaine/exceptions.rb", "lib/cocaine/version.rb", "spec/cocaine/command_line/runners/backticks_runner_spec.rb", "spec/cocaine/command_line/runners/fake_runner_spec.rb", "spec/cocaine/command_line/runners/posix_runner_spec.rb", "spec/cocaine/command_line/runners/process_runner_spec.rb", "spec/cocaine/command_line_spec.rb", "spec/spec_helper.rb", "spec/support/fake_logger.rb", "spec/support/nonblocking_examples.rb", "spec/support/stub_os.rb", "spec/support/with_exitstatus.rb"]
  s.homepage = %q{http://github.com/thoughtbot/cocaine}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A small library for doing (command) lines}
  s.test_files = ["spec/cocaine/command_line/runners/backticks_runner_spec.rb", "spec/cocaine/command_line/runners/fake_runner_spec.rb", "spec/cocaine/command_line/runners/posix_runner_spec.rb", "spec/cocaine/command_line/runners/process_runner_spec.rb", "spec/cocaine/command_line_spec.rb", "spec/spec_helper.rb", "spec/support/fake_logger.rb", "spec/support/nonblocking_examples.rb", "spec/support/stub_os.rb", "spec/support/with_exitstatus.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<posix-spawn>, [">= 0"])
      s.add_development_dependency(%q<active_support>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<posix-spawn>, [">= 0"])
      s.add_dependency(%q<active_support>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<posix-spawn>, [">= 0"])
    s.add_dependency(%q<active_support>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
