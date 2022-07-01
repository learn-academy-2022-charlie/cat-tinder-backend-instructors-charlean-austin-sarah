class CatsController < ApplicationController

  def index
    # gather all of the relevant information from the database
    cats = Cat.all
    # send the information over as the specified datatype -> json
    render json: cats
  end

  def create
    cat = Cat.create(cat_params)
    if cat.valid?
      render json: cat
    else
      render json: cat.errors, status: 422
    end
  end

  def update
    cat = Cat.find(params[:id])
    cat.update(cat_params)
    render json: cat
  end

  def destroy
    
  end
  
  private

    def cat_params
      params.require(:cat).permit(:name, :age, :enjoys, :image)
    end

end
