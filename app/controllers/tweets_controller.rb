class TweetsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
  
    
    if @tweet.save
      redirect_to @tweet, notice: 'You tweeted!'
    else
      render :new
    end
  end
  
  def edit
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
  
  private
  
  # WHITELIST
  
  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end
