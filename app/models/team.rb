class Team < ActiveRecord::Base
  has_and_belongs_to_many :mutants
  has_many :tasks

  validates :name, presence: true
end
