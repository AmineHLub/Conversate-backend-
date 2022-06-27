class DirectComment < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_many :nested_comments, dependent: :destroy
end
