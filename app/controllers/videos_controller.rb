class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to video_path(@video)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def video_params
    params.require(:video).permit(:photo)
  end
end
