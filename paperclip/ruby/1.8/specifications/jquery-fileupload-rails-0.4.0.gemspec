# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jquery-fileupload-rails}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tors Dalid"]
  s.date = %q{2012-12-06}
  s.description = %q{jQuery File Upload by Sebastian Tschan integrated for Rails 3.1 Asset Pipeline}
  s.email = ["cletedalid@gmail.com"]
  s.files = ["lib/jquery/fileupload/rails/engine.rb", "lib/jquery/fileupload/rails/middleware.rb", "lib/jquery/fileupload/rails/upload.rb", "lib/jquery/fileupload/rails/version.rb", "lib/jquery-fileupload-rails.rb", "vendor/assets/images/loading.gif", "vendor/assets/images/progressbar.gif", "vendor/assets/javascripts/jquery-fileupload/basic.js", "vendor/assets/javascripts/jquery-fileupload/cors/jquery.postmessage-transport.js", "vendor/assets/javascripts/jquery-fileupload/cors/jquery.xdr-transport.js", "vendor/assets/javascripts/jquery-fileupload/index.js", "vendor/assets/javascripts/jquery-fileupload/jquery.fileupload-fp.js", "vendor/assets/javascripts/jquery-fileupload/jquery.fileupload-ui.js", "vendor/assets/javascripts/jquery-fileupload/jquery.fileupload.js", "vendor/assets/javascripts/jquery-fileupload/jquery.iframe-transport.js", "vendor/assets/javascripts/jquery-fileupload/locale.js", "vendor/assets/javascripts/jquery-fileupload/vendor/canvas-to-blob.js", "vendor/assets/javascripts/jquery-fileupload/vendor/jquery.ui.widget.js", "vendor/assets/javascripts/jquery-fileupload/vendor/load-image.js", "vendor/assets/javascripts/jquery-fileupload/vendor/tmpl.js", "vendor/assets/stylesheets/jquery.fileupload-ui.css.erb", "Rakefile", "README.md"]
  s.homepage = %q{https://github.com/tors/jquery-fileupload-rails}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{jquery-fileupload-rails}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{jQuery File Upload for Rails 3.1 Asset Pipeline}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.1"])
      s.add_development_dependency(%q<rails>, [">= 3.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.1"])
      s.add_dependency(%q<actionpack>, [">= 3.1"])
      s.add_dependency(%q<rails>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1"])
    s.add_dependency(%q<actionpack>, [">= 3.1"])
    s.add_dependency(%q<rails>, [">= 3.1"])
  end
end
