# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activerecord}
  s.version = "3.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson"]
  s.date = %q{2013-01-08}
  s.description = %q{Databases on Rails. Build a persistent domain model by mapping database tables to Ruby classes. Strong conventions for associations, validations, aggregations, migrations, and testing come baked-in.}
  s.email = %q{david@loudthinking.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["CHANGELOG.md", "MIT-LICENSE", "README.rdoc", "examples/associations.png", "examples/performance.rb", "examples/simple.rb", "lib/active_record/aggregations.rb", "lib/active_record/associations/alias_tracker.rb", "lib/active_record/associations/association.rb", "lib/active_record/associations/association_scope.rb", "lib/active_record/associations/belongs_to_association.rb", "lib/active_record/associations/belongs_to_polymorphic_association.rb", "lib/active_record/associations/builder/association.rb", "lib/active_record/associations/builder/belongs_to.rb", "lib/active_record/associations/builder/collection_association.rb", "lib/active_record/associations/builder/has_and_belongs_to_many.rb", "lib/active_record/associations/builder/has_many.rb", "lib/active_record/associations/builder/has_one.rb", "lib/active_record/associations/builder/singular_association.rb", "lib/active_record/associations/collection_association.rb", "lib/active_record/associations/collection_proxy.rb", "lib/active_record/associations/has_and_belongs_to_many_association.rb", "lib/active_record/associations/has_many_association.rb", "lib/active_record/associations/has_many_through_association.rb", "lib/active_record/associations/has_one_association.rb", "lib/active_record/associations/has_one_through_association.rb", "lib/active_record/associations/join_dependency/join_association.rb", "lib/active_record/associations/join_dependency/join_base.rb", "lib/active_record/associations/join_dependency/join_part.rb", "lib/active_record/associations/join_dependency.rb", "lib/active_record/associations/join_helper.rb", "lib/active_record/associations/preloader/association.rb", "lib/active_record/associations/preloader/belongs_to.rb", "lib/active_record/associations/preloader/collection_association.rb", "lib/active_record/associations/preloader/has_and_belongs_to_many.rb", "lib/active_record/associations/preloader/has_many.rb", "lib/active_record/associations/preloader/has_many_through.rb", "lib/active_record/associations/preloader/has_one.rb", "lib/active_record/associations/preloader/has_one_through.rb", "lib/active_record/associations/preloader/singular_association.rb", "lib/active_record/associations/preloader/through_association.rb", "lib/active_record/associations/preloader.rb", "lib/active_record/associations/singular_association.rb", "lib/active_record/associations/through_association.rb", "lib/active_record/associations.rb", "lib/active_record/attribute_methods/before_type_cast.rb", "lib/active_record/attribute_methods/dirty.rb", "lib/active_record/attribute_methods/primary_key.rb", "lib/active_record/attribute_methods/query.rb", "lib/active_record/attribute_methods/read.rb", "lib/active_record/attribute_methods/time_zone_conversion.rb", "lib/active_record/attribute_methods/write.rb", "lib/active_record/attribute_methods.rb", "lib/active_record/autosave_association.rb", "lib/active_record/base.rb", "lib/active_record/callbacks.rb", "lib/active_record/coders/yaml_column.rb", "lib/active_record/connection_adapters/abstract/connection_pool.rb", "lib/active_record/connection_adapters/abstract/connection_specification.rb", "lib/active_record/connection_adapters/abstract/database_limits.rb", "lib/active_record/connection_adapters/abstract/database_statements.rb", "lib/active_record/connection_adapters/abstract/query_cache.rb", "lib/active_record/connection_adapters/abstract/quoting.rb", "lib/active_record/connection_adapters/abstract/schema_definitions.rb", "lib/active_record/connection_adapters/abstract/schema_statements.rb", "lib/active_record/connection_adapters/abstract_adapter.rb", "lib/active_record/connection_adapters/column.rb", "lib/active_record/connection_adapters/mysql2_adapter.rb", "lib/active_record/connection_adapters/mysql_adapter.rb", "lib/active_record/connection_adapters/postgresql_adapter.rb", "lib/active_record/connection_adapters/sqlite3_adapter.rb", "lib/active_record/connection_adapters/sqlite_adapter.rb", "lib/active_record/connection_adapters/statement_pool.rb", "lib/active_record/counter_cache.rb", "lib/active_record/dynamic_finder_match.rb", "lib/active_record/dynamic_scope_match.rb", "lib/active_record/errors.rb", "lib/active_record/fixtures.rb", "lib/active_record/identity_map.rb", "lib/active_record/locale/en.yml", "lib/active_record/locking/optimistic.rb", "lib/active_record/locking/pessimistic.rb", "lib/active_record/log_subscriber.rb", "lib/active_record/migration/command_recorder.rb", "lib/active_record/migration.rb", "lib/active_record/named_scope.rb", "lib/active_record/nested_attributes.rb", "lib/active_record/observer.rb", "lib/active_record/persistence.rb", "lib/active_record/query_cache.rb", "lib/active_record/railtie.rb", "lib/active_record/railties/console_sandbox.rb", "lib/active_record/railties/controller_runtime.rb", "lib/active_record/railties/databases.rake", "lib/active_record/railties/jdbcmysql_error.rb", "lib/active_record/reflection.rb", "lib/active_record/relation/batches.rb", "lib/active_record/relation/calculations.rb", "lib/active_record/relation/finder_methods.rb", "lib/active_record/relation/predicate_builder.rb", "lib/active_record/relation/query_methods.rb", "lib/active_record/relation/spawn_methods.rb", "lib/active_record/relation.rb", "lib/active_record/result.rb", "lib/active_record/schema.rb", "lib/active_record/schema_dumper.rb", "lib/active_record/serialization.rb", "lib/active_record/serializers/xml_serializer.rb", "lib/active_record/session_store.rb", "lib/active_record/test_case.rb", "lib/active_record/timestamp.rb", "lib/active_record/transactions.rb", "lib/active_record/validations/associated.rb", "lib/active_record/validations/uniqueness.rb", "lib/active_record/validations.rb", "lib/active_record/version.rb", "lib/active_record.rb", "lib/rails/generators/active_record/migration/migration_generator.rb", "lib/rails/generators/active_record/migration/templates/migration.rb", "lib/rails/generators/active_record/migration.rb", "lib/rails/generators/active_record/model/model_generator.rb", "lib/rails/generators/active_record/model/templates/migration.rb", "lib/rails/generators/active_record/model/templates/model.rb", "lib/rails/generators/active_record/model/templates/module.rb", "lib/rails/generators/active_record/observer/observer_generator.rb", "lib/rails/generators/active_record/observer/templates/observer.rb", "lib/rails/generators/active_record/session_migration/session_migration_generator.rb", "lib/rails/generators/active_record/session_migration/templates/migration.rb", "lib/rails/generators/active_record.rb"]
  s.homepage = %q{http://www.rubyonrails.org}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Object-relational mapper framework (part of Rails).}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 4

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["= 3.1.10"])
      s.add_runtime_dependency(%q<activemodel>, ["= 3.1.10"])
      s.add_runtime_dependency(%q<arel>, ["~> 2.2.3"])
      s.add_runtime_dependency(%q<tzinfo>, ["~> 0.3.29"])
    else
      s.add_dependency(%q<activesupport>, ["= 3.1.10"])
      s.add_dependency(%q<activemodel>, ["= 3.1.10"])
      s.add_dependency(%q<arel>, ["~> 2.2.3"])
      s.add_dependency(%q<tzinfo>, ["~> 0.3.29"])
    end
  else
    s.add_dependency(%q<activesupport>, ["= 3.1.10"])
    s.add_dependency(%q<activemodel>, ["= 3.1.10"])
    s.add_dependency(%q<arel>, ["~> 2.2.3"])
    s.add_dependency(%q<tzinfo>, ["~> 0.3.29"])
  end
end
