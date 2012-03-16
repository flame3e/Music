class SongsController < ApplicationController
  def index
  @songs = AWS::S3::Bucket.find(BUCKET).objects
  end

  def upload
  begin
    fileName = params[:mp3file].original_filename
    fileName[fileName.length-4] = "SpLiT" + current_user.email + "."
    AWS::S3::S3Object.store(fileName, params[:mp3file].read, BUCKET, :access => :public_read)
    redirect_to "/songs/index"
  rescue
    render :text => "Couldn't complete the upload"
  end
end

  def delete
    if (params[:song])
    AWS::S3::S3Object.find(params[:song], BUCKET).delete
    redirect_to "/songs/index"
else
    render :text => "No song was found to delete!"
end
  end

private  
  
#def sanitize_filename(file_name)  
 #   just_filename = File.basename(file_name)  
  #  just_filename.sub(/[^\w\.\-]/,'_') 
    
#end  

end
