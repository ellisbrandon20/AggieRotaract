class ImgUploadController < ApplicationController

  def new

  end
  
  def create
    
    upload=params[:upload]
    name = upload[:file].original_filename
    
    puts Dir.pwd
    
    # this is where we store temporary files and in the Events#create action we upload the images to cloudinary
    directory = "public/images"
    
    path = File.join(directory, name)
    
    File.open(path, "wb") { |f| f.write(upload[:file].read) }
    
    flash[:success] = "File uploaded"
    session[:image_upload] = name
    
    puts "----- complete"
    
  end
end
