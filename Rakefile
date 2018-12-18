#require "bundler/gem_tasks"
#require "rspec/core/rake_task"

#RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Ejecutar pruebas sobre Ordenacion"
task :spec do
  sh "rspec -I. spec/Repr_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
  sh "rspec -I. spec/Repr_spec.rb --format documentation"
end

