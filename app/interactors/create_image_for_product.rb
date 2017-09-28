class CreateImageForProduct
  include Interactor

  def call
    data = context.image

    image_data = Base64.decode64(data['data:image/png;base64,'.length..-1])
    image_location = "#{Rails.root}/public/uploads/#{context.product.id}.png"

    File.open(image_location, 'wb') do |f|
      f.write image_data
    end
    # I temporarly removed uploading to s3, because my account is banned for some reason

    # service = Aws::S3::Resource.new(region: "us-east-2")
    # bucket_name = "jewelry-shop-images"
    # bucket = service.bucket(bucket_name)

    # key = "images/" + File.basename(image_location)
    # s3_file = bucket.object(key)
    # s3_file.upload_file(image_location)
    result_image = "/uploads/#{context.product.id}.png"
    context.product.update(image: result_image)
  end
end
