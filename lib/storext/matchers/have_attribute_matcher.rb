module Storext::Matchers
  class HaveAttributeMatcher

    def initialize(name, type = nil)
      @name = name
      @expected_type = type
    end

    def in_column(column)
      @expected_column = column
      self
    end

    def with_default(expected_default)
      @expected_default = expected_default
      self
    end

    def matches?(class_or_record)
      @klass = class_or_record.is_a?(ActiveRecord::Base) ?
        class_or_record.class : class_or_record
      definition = @klass.storext_definitions[@name]

      definition.present? &&
        matches_type?(definition[:type]) &&
        matches_column?(definition[:column]) &&
        matches_default?(definition[:opts][:default])
    end

    def description
      messages = ["have attribute #{@name}"]
      messages << ["of type #{@expected_type}"]
      if @expected_column
        messages << [%Q(in column "#{@expected_column}")]
      end
      if @expected_default
        messages << [%Q(with default "#{@expected_default}")]
      end

      messages.join(" ")
    end

    def failure_message
      "expected #{@klass} to #{description}"
    end

    private

    def matches_type?(type)
      return true if @expected_type.nil?
      @expected_type == type
    end

    def matches_column?(column)
      return true if @expected_column.nil?
      @expected_column == column
    end

    def matches_default?(default)
      return true if @expected_default.nil?
      @expected_default == default
    end

  end
end
