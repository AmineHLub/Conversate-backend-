class User < ApplicationRecord
  has_many :conversations, dependent: :destroy
  has_many :direct_comments, dependent: :destroy
  has_many :nested_comments, dependent: :destroy
end
