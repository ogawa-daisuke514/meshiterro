class Favorite < ApplicationRecord
  belongs_to :postimage
  belongs_to :user
end
