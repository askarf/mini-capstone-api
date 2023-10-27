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
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      stock: params[:stock],
    )
    @product.save
    render :show
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name, price: params["price"] || @product.price,
      image_url: params["image_url"] || @product.image_url,
      stock: params["stock"] || @product.stock,
      description: params["description"] || @product.description,
    )
    render :show
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: "Product deleted"
  end
end
