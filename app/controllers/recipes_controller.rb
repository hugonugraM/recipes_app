class RecipesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

end
