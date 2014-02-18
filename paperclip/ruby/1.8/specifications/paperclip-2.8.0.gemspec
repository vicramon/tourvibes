# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{paperclip}
  s.version = "2.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jon Yurek"]
  s.date = %q{2012-10-07}
  s.description = %q{Easy upload management for ActiveRecord}
  s.email = ["jyurek@thoughtbot.com"]
  s.files = [".gitignore", ".travis.yml", "Appraisals", "CONTRIBUTING.md", "Gemfile", "Gemfile.lock", "LICENSE", "NEWS", "README.md", "Rakefile", "cucumber/paperclip_steps.rb", "features/basic_integration.feature", "features/rake_tasks.feature", "features/step_definitions/attachment_steps.rb", "features/step_definitions/html_steps.rb", "features/step_definitions/rails_steps.rb", "features/step_definitions/s3_steps.rb", "features/step_definitions/web_steps.rb", "features/support/env.rb", "features/support/fakeweb.rb", "features/support/fixtures/.boot_config.rb.swo", "features/support/fixtures/boot_config.txt", "features/support/fixtures/gemfile.txt", "features/support/fixtures/preinitializer.txt", "features/support/paths.rb", "features/support/rails.rb", "features/support/selectors.rb", "gemfiles/rails2.gemfile", "gemfiles/rails3.gemfile", "gemfiles/rails3_1.gemfile", "gemfiles/rails3_2.gemfile", "generators/paperclip/USAGE", "generators/paperclip/paperclip_generator.rb", "generators/paperclip/templates/paperclip_migration.rb.erb", "init.rb", "lib/generators/paperclip/USAGE", "lib/generators/paperclip/paperclip_generator.rb", "lib/generators/paperclip/templates/paperclip_migration.rb.erb", "lib/paperclip.rb", "lib/paperclip/attachment.rb", "lib/paperclip/attachment_options.rb", "lib/paperclip/callback_compatibility.rb", "lib/paperclip/geometry.rb", "lib/paperclip/interpolations.rb", "lib/paperclip/iostream.rb", "lib/paperclip/matchers.rb", "lib/paperclip/matchers/have_attached_file_matcher.rb", "lib/paperclip/matchers/validate_attachment_content_type_matcher.rb", "lib/paperclip/matchers/validate_attachment_presence_matcher.rb", "lib/paperclip/matchers/validate_attachment_size_matcher.rb", "lib/paperclip/missing_attachment_styles.rb", "lib/paperclip/processor.rb", "lib/paperclip/railtie.rb", "lib/paperclip/schema.rb", "lib/paperclip/storage.rb", "lib/paperclip/storage/filesystem.rb", "lib/paperclip/storage/fog.rb", "lib/paperclip/storage/s3.rb", "lib/paperclip/style.rb", "lib/paperclip/thumbnail.rb", "lib/paperclip/upfile.rb", "lib/paperclip/url_generator.rb", "lib/paperclip/version.rb", "lib/tasks/paperclip.rake", "paperclip.gemspec", "rails/init.rb", "shoulda_macros/paperclip.rb", "test/attachment_options_test.rb", "test/attachment_test.rb", "test/database.yml", "test/fixtures/12k.png", "test/fixtures/50x50.png", "test/fixtures/5k.png", "test/fixtures/animated.gif", "test/fixtures/bad.png", "test/fixtures/fog.yml", "test/fixtures/s3.yml", "test/fixtures/spaced file.png", "test/fixtures/text.txt", "test/fixtures/twopage.pdf", "test/fixtures/uppercase.PNG", "test/geometry_test.rb", "test/helper.rb", "test/integration_test.rb", "test/interpolations_test.rb", "test/iostream_test.rb", "test/matchers/have_attached_file_matcher_test.rb", "test/matchers/validate_attachment_content_type_matcher_test.rb", "test/matchers/validate_attachment_presence_matcher_test.rb", "test/matchers/validate_attachment_size_matcher_test.rb", "test/paperclip_missing_attachment_styles_test.rb", "test/paperclip_test.rb", "test/processor_test.rb", "test/schema_test.rb", "test/storage/filesystem_test.rb", "test/storage/fog_test.rb", "test/storage/s3_live_test.rb", "test/storage/s3_test.rb", "test/style_test.rb", "test/support/mock_attachment.rb", "test/support/mock_interpolator.rb", "test/support/mock_model.rb", "test/support/mock_url_generator_builder.rb", "test/thumbnail_test.rb", "test/upfile_test.rb", "test/url_generator_test.rb"]
  s.homepage = %q{https://github.com/thoughtbot/paperclip}
  s.require_paths = ["lib"]
  s.requirements = ["ImageMagick"]
  s.rubyforge_project = %q{paperclip}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{File attachments as attributes for ActiveRecord}
  s.test_files = ["features/basic_integration.feature", "features/rake_tasks.feature", "features/step_definitions/attachment_steps.rb", "features/step_definitions/html_steps.rb", "features/step_definitions/rails_steps.rb", "features/step_definitions/s3_steps.rb", "features/step_definitions/web_steps.rb", "features/support/env.rb", "features/support/fakeweb.rb", "features/support/fixtures/.boot_config.rb.swo", "features/support/fixtures/boot_config.txt", "features/support/fixtures/gemfile.txt", "features/support/fixtures/preinitializer.txt", "features/support/paths.rb", "features/support/rails.rb", "features/support/selectors.rb", "test/attachment_options_test.rb", "test/attachment_test.rb", "test/database.yml", "test/fixtures/12k.png", "test/fixtures/50x50.png", "test/fixtures/5k.png", "test/fixtures/animated.gif", "test/fixtures/bad.png", "test/fixtures/fog.yml", "test/fixtures/s3.yml", "test/fixtures/spaced file.png", "test/fixtures/text.txt", "test/fixtures/twopage.pdf", "test/fixtures/uppercase.PNG", "test/geometry_test.rb", "test/helper.rb", "test/integration_test.rb", "test/interpolations_test.rb", "test/iostream_test.rb", "test/matchers/have_attached_file_matcher_test.rb", "test/matchers/validate_attachment_content_type_matcher_test.rb", "test/matchers/validate_attachment_presence_matcher_test.rb", "test/matchers/validate_attachment_size_matcher_test.rb", "test/paperclip_missing_attachment_styles_test.rb", "test/paperclip_test.rb", "test/processor_test.rb", "test/schema_test.rb", "test/storage/filesystem_test.rb", "test/storage/fog_test.rb", "test/storage/s3_live_test.rb", "test/storage/s3_test.rb", "test/style_test.rb", "test/support/mock_attachment.rb", "test/support/mock_interpolator.rb", "test/support/mock_model.rb", "test/support/mock_url_generator_builder.rb", "test/thumbnail_test.rb", "test/upfile_test.rb", "test/url_generator_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.3.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.2"])
      s.add_runtime_dependency(%q<cocaine>, [">= 0.0.2"])
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<appraisal>, ["~> 0.4.0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<aws-sdk>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.5"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.1.0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<cocaine>, ["~> 0.4.0"])
      s.add_development_dependency(%q<fog>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.3.0"])
      s.add_dependency(%q<activesupport>, [">= 2.3.2"])
      s.add_dependency(%q<cocaine>, [">= 0.0.2"])
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<appraisal>, ["~> 0.4.0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<aws-sdk>, [">= 0"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.5"])
      s.add_dependency(%q<cucumber>, ["~> 1.1.0"])
      s.add_dependency(%q<aruba>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<cocaine>, ["~> 0.4.0"])
      s.add_dependency(%q<fog>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.3.0"])
    s.add_dependency(%q<activesupport>, [">= 2.3.2"])
    s.add_dependency(%q<cocaine>, [">= 0.0.2"])
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<appraisal>, ["~> 0.4.0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<aws-sdk>, [">= 0"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.5"])
    s.add_dependency(%q<cucumber>, ["~> 1.1.0"])
    s.add_dependency(%q<aruba>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<cocaine>, ["~> 0.4.0"])
    s.add_dependency(%q<fog>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
  end
end
