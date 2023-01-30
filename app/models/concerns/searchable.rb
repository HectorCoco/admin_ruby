module Searchable
  extend ActiveSupport::Concern

  included do
    scope :by_column, ->(column, value) { where("CAST(#{column} AS VARCHAR ) ILIKE ?", "%#{value}%") if value.present? }
  end

  class_methods do
    def search(columns, value)
      results = []

      columns.each do |column|
        results << by_column(column, value)
      end

      results.flatten
    end
  end
end
