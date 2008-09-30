class ImagesController < ApplicationController
  
  def index
    redirect_to image_path('scawymonstur')
  end
  
  def show
    @image_sets = ImageSet.find(:all)
    set = params[:id]
    ps = {"set" => set, "start" => 0, "num" => 50, "type" => 'photo'}
    ps.merge!(params)
    
    @images = Image.tumble(ps)
  end
  
end
