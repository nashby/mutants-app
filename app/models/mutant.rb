class Mutant < ActiveRecord::Base
  has_and_belongs_to_many :teams

  validates :name, presence: true
end
