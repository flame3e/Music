module ApplicationHelper
  BUCKET = 'awadabdnu06ram0'
  def download_url_for(song_key)  
    AWS::S3::S3Object.url_for(song_key, BUCKET, :authenticated => false)  
end  
  
end
