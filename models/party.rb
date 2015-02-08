require_relative "employee"
class Party < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :foods, through: :orders
  belongs_to :employee

  def self.open_tables
      range = (1..40)
      table = range.to_a
      parties = Party.all
      not_paid = parties.where(paid: 'f')
      unavailable = not_paid.map do |table|
          table.table_number
      end
      return available = table - unavailable
  end

  def assign_table
    available = Party.open_tables
    available.shuffle.pop
    table_number = available.shuffle.pop
    self.update(table_number: table_number)
  end
end
