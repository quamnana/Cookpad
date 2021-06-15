class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :author, class_name: "User"

  # callback
  after_create :notify_recipe_creator

  private

  def notify_recipe_creator
    Notification.create( notify_type: 'recipe', actor: author, user: recipe.user, target: self, second_target: recipe)
  end
end
