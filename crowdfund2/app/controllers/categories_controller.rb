class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def show
     @projects = @category.projects
  end #show

  def index
     @categories = Category.all
  end #index

  def edit
  end #edit

  def update
    if @category.update(category_params)
      redirect_to categories_url, notice: "Success! #{@category.name} has been updated"
    else
      render :edit
    end #if
  end #update
    
  def new
     @category = Category.new
  end #new

  def create
    @category = Category.new(category_params)
    @category.save
    if @category.save
      redirect_to categories_url, notice: "#{@category.name} has been successfully added!"
    else
      render :new
    end #if
  end #create
  
  def destroy
     @category.destroy
     redirect_to categories_url, alert: "#{@category.name} has been deleted!"
  end #destroy
    
    

private

  def set_category
    @category = Category.find(params[:id])
  end #set_category


  def category_params
    params.require(:category).permit(:name) 
  end #category_params
end #CategoriesController
