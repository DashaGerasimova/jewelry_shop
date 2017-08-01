require 'base64'
require 'aws-sdk'

class ProductsController < ApplicationController
  expose :products, ->{ Product.all }
  expose :product
  
  def index
  end

  
  def show
  end

  def new
  end

  def edit
  end

  def create
    product.user = current_user
    
    product.save
    save_image_to_product
    respond_with product
  end

  def update
    product.update(product_params)
    save_image_to_product
    respond_with product
  end

  def destroy
    product.destroy
    respond_with product
  end

  private
  
    def save_image_to_product()
      data = params[:image]

      image_data = Base64.decode64(data['data:image/png;base64,'.length .. -1])
      image_location = "#{Rails.root}/public/uploads/#{product.id}.png"

      File.open(image_location, 'wb') do |f|
        f.write image_data
      end

      # service = Aws::S3::Resource.new(region: "us-east-2")
      # bucket_name = "jewelry-shop-images"
      # bucket = service.bucket(bucket_name)

      # key = "images/" + File.basename(image_location)
      # s3_file = bucket.object(key)
      # s3_file.upload_file(image_location)
      product.image = "/uploads/#{product.id}.png"
      product.save
    end    
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :desc, :style, :size, :image, :price)
    end
end
