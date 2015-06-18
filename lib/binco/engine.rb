require 'bootstrap-datepicker-rails'
require 'select2-rails'
require 'will_paginate'

module Binco
  class Engine < ::Rails::Engine
  end

  class << self
    mattr_accessor :breadcrumb_before,
                :breadcrumb_default
    self.breadcrumb_before = nil
    self.breadcrumb_default = nil
  end

  def self.configure(&block)
    yield self
  end
end
