require 'file_processor'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
