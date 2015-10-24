$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record'
require 'storext'
require 'rspec'
require 'pry'
require 'yaml'
require 'storext/matchers'

SPEC_DIR = File.dirname(__FILE__)
ROOT_DIR = File.join(SPEC_DIR, "..")

DB_CONFIG = YAML.load_file(File.join(ROOT_DIR, "db", "config.yml"))["test"]
ActiveRecord::Base.establish_connection(DB_CONFIG)

Dir[File.join(SPEC_DIR, "fixtures", "**", "*.rb")].each { |f| require f }
