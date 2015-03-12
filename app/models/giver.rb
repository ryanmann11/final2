class Giver < ActiveRecord::Base
  belongs_to :sponsor, dependent: :destroy
  belongs_to :case
  belongs_to :firm
end
