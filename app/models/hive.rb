class Hive < ApplicationRecord
  validates :name, presence: true, length: { minimum: 6 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
end
