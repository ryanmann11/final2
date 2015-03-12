class Sponsor < ActiveRecord::Base
  belongs_to :case
  belongs_to :giver
end
