class ImagesController < ApplicationController
  def index
    @images = Image.all
    render :index
  end

  def show
    @image = Image.find_by(id: params["id"])
    render :show
  end

  def create
    @image = Image.new(
      url: params[:url],
      product_id: params[:product_id],
    )
    @image.save
    if @image.valid?
      render :show
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @image = Image.find_by(id: params["id"])
    @image.update(
      url: params["url"] || @image.url,
      product_id: params["product_id"] || @image.product_id,

    )
    render :show
  end

  def destroy
    image = Image.find_by(id: params["id"])
    image.destroy
    render json: "Image deleted"
  end
end
