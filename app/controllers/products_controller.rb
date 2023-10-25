class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params["id"])
    render :show
  end

  def create
    @product = Product.new(
      name: "Marc Jacobs Watch",
      price: 75,
      image_url: "www.tbd.com",
      description: "slightly worn silver Marc by Marc jacobs watch.",
    )
    @product.save
    render :show
  end
end
