class UrlsController < ApplicationController
    def create
      @url = Url.new(url_params)
      @url.shortened = SecureRandom.hex(4) # Generate a unique 4-character hex code
  
      if @url.save
        redirect_to @url.original
      else
        render :new
      end
    end

    def show
        @url = Url.find_by(shortened: params[:shortened])
        redirect_to @url.original
      end    
  
    private
  
    def url_params
      params.require(:url).permit(:original)
    end
  end