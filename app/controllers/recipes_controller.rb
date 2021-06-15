class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy, :like, :dislike]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@recipe = Recipe.all.order(created_at: :desc)
	end

	def show
		@comment = Comment.new
		@comment.recipe_id = @recipe.id
	end

	def new
		@recipe = current_user.recipes.build
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)

		if @recipe.save
			redirect_to @recipe, notice: "You successfully saved your recipe!"
		else
			flash[:alert] = "Your recipe wasnt created!"
			render "new"
		end
	end

	def edit
		
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe, notice: "You successfully updated your recipe!"
		else
			render "edit"
		end
	end

	def like
		@recipe.liked_by current_user
		redirect_to @recipe
	end

	def dislike
		@recipe.disliked_by current_user
		redirect_to @recipe
	end

	def destroy
		@recipe.destroy
		redirect_to root_path, notice: "You successfully deleted your recipe!"
	end




	private
		def recipe_params
			params.require(:recipe).permit(:title, :description, :image,  ingredients_attributes: [:id, :name, :_destroy],  
				directions_attributes: [:id, :step, :_destroy])
		end

		def find_recipe
			@recipe = Recipe.find(params[:id])

		rescue ActiveRecord::RecordNotFound 
			flash[:alert] = "The page you requested does not exist"
			redirect_to recipes_path
		end

end
