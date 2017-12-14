class DojosController < ApplicationController
  
  def index
    @count = Dojo.count
    @dojos = Dojo.all
    render 'index'
  end

  def new
    render 'new'
  end

  def create
    Dojo.create(dojo_params)
    # redirect_to root_url,notice: "You did it"
    # if errors?
    #   flash[:error] = "You have errors"
    #   redirect_to '/dojos/new'
    # else
    #   flash[:success] = "You did it!"
    #   redirect_to root_url
    # end
    redirect_to root_url
  end

  def show
    @dojo = Dojo.find(params[:id])
    render 'show'
  end

  def destroy
    Dojo.destroy(params[:id])
    redirect_to root_url
  end

  def edit
    @edit_dojo = Dojo.find(params[:id])
    render 'edit'
  end

  def update
    dojo = Dojo.find(params[:id])
    dojo.update(dojo_params)
    redirect_to root_url
  end


  private
  def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
end
