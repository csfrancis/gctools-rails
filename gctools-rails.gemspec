$:.unshift File.expand_path("../lib", __FILE__)

require 'gctools/rails/version'

Gem::Specification.new do |s|
  s.name = 'gctools-rails'
  s.version = Gctools::Rails::VERSION
  s.summary = 'rails logging with gctools'
  s.description = 'rails controller logging of GC stats using gctools'

  s.homepage = 'https://github.com/csfrancis/gctools-rails'
  s.authors = 'Scott Francis'
  s.email   = 'scott.francis@shopify.com'
  s.license = 'MIT'

  s.files = `git ls-files`.split("\n")
  s.add_runtime_dependency 'gctools', '~> 0.2', '>= 0.2.3'
end
