class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save
        flash[:success] = "New recipe has been created."
        redirect_to recipe_path(@recipe.id)
      else
        flash[:error] = "There was an error saving your form."
        render :new
      end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
        flash[:notice] = "recipe has been updated."
        redirect_to recipe_path(@recipe.id)
      else
        flash[:error] = "There was a problem updating your form."
        render :edit
      end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Your recipe was destroyed"
    redirect_to recipes_path
    
  end
  


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :cook_time, :instructions, :picture, :ingredients, :chef_id)
  end
end
