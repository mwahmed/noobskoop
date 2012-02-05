require "simple_search"
require "active_record"
ActiveRecord::Base.send(:extend, SimpleSearch::ClassMethods)
