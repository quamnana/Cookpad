class CommentsController < ApplicationController
	before_action :set_recipe
	before_action :authenticate_user!
	#skip_after_action :verify_authorized


	def create
		@comment = @recipe.comments.build(comment_params)
		@comment.author = current_user
		#authorize @comment, :create?

		if @comment.save
			flash[:notice] = "Comment was added to recipe successfully!"
			redirect_to recipe_path(@comment.recipe)
		else
			flash[:alert] = "Comment was not added!"
			redirect_to recipe_path(@comment.recipe)
		end
	end








	private
		def set_recipe
			@recipe = Recipe.find(params[:recipe_id])
		end

		def comment_params
			params.require(:comment).permit(:body)
		end

end
