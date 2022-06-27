class NestedComment < ApplicationRecord
  belongs_to :user
  belongs_to :direct_comment
end
