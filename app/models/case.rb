 class Case < ActiveRecord::Base
  belongs_to :firm
  has_many :reviews
  belongs_to :giver

  validates :name, presence: true
end
