class ImgUploadController < ApplicationController

  def new

  end

  def create
    name = params[:upload][:file].original_filename
    directory = "app/assets/images"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    flash[:notice] = "File uploaded"
    session[:image_upload] = name
  end
end
