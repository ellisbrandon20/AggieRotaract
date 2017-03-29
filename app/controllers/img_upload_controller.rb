class ImgUploadController < ApplicationController

  def new

  end
  
  def create
    
    upload=params[:upload]
    name = upload[:file].original_filename
    
    puts Dir.pwd
    
    directory = "public/images"
    # POSSIBLE BUG WITH HEROKU
    #   heroku does not have this absolute path????
    
    
    
    path = File.join(directory, name)
    
    File.open(path, "wb") { |f| f.write(upload[:file].read) }
    
    flash[:success] = "File uploaded"
    session[:image_upload] = name
    
    puts "----- complete"
    
  end
end
