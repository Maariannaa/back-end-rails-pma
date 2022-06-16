class Api::V1::ListsController < ApplicationController
  before_action :find_list, only: [:show, :update, :destroy]
  before_action :current_api_v1_user

  def index
    @lists = List.all
    render json: @lists, :include => [:products]
  end

  def show
    render json: @list
  end

  def create
    @list = List.new(list_params)
    if @list.save
     render json: @list
    else
     render error: { error: 'Unable to create List.'}, status: 400
    end
  end

  def update
    if @list
     @list.update(list_params)
     render json: { message: 'List successfully update.'}, status:200
    else
     render json: { error: 'Unable to update List.'}, status:400
    end
  end

  def destroy
    if @list
     @list.destroy
     render json: { message: 'List successfully deleted.'}, status:200
    else
     render json: { error: 'Unable to delete List. '}, status:400
    end
  end

  private

  def list_params
    params.require(:list).permit(
      :title,
      :user_id,
    )
  end

  def find_list
    @list = List.find(params[:id])
  end

end
