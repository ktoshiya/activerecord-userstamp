module ActiveRecord
  module Userstamp
    module MigrationHelper
      extend ActiveSupport::Concern

      def userstamps(*args)
        config = ActiveRecord::Userstamp.config
        column(config.creator_attribute, :integer, *args)
        column(config.updater_attribute, :integer, *args)
        column(config.deleter_attribute, :integer, *args) if config.deleter_attribute.present?
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::TableDefinition.class_eval do
  include ActiveRecord::Userstamp::MigrationHelper
end
