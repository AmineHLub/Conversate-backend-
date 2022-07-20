class Conversation < ApplicationRecord
  belongs_to :user
  has_many :direct_comments, dependent: :destroy
end
