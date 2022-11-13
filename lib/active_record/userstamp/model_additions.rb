module ActiveRecord
  module Userstamp
    module ModelAdditions
      extend ActiveSupport::Concern

      include ActiveRecord::Userstamp::Stampable
      include ActiveRecord::Userstamp::Stamper
    end
  end
end

ActiveRecord::Base.class_eval do
  include ActiveRecord::Userstamp::ModelAdditions
end
