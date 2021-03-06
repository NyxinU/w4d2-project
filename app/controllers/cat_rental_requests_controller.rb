class CatRentalRequestsController < ApplicationController

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(request_params)
    @cat = Cat.find_by(id: params[:cat_rental_request][:cat_id])
    if @request.save
      redirect_to cat_url(@cat)
    else
      render json: @request.errors.full_messages
    end
  end

private

def request_params
  params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
end

end
