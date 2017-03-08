class ImgUploadController < ApplicationController

  def new

  end
  
  def create
    
    upload=params[:upload]
    name = upload[:file].original_filename
    
    directory = "app/assets/images"
    path = File.join(directory, name)
    
    File.open(path, "wb") { |f| f.write(upload[:file].read) }
    
    flash[:notice] = "File uploaded"
    session[:image_upload] = name
    
  end
end
