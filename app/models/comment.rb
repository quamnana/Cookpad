class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :author, class_name: "User"
end
