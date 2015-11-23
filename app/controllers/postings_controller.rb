class PostingsController < ApplicationController
  def index
    if params[:provider_id]
      @provider = Provider.find(params[:provider_id])
      @postings = @provider.postings
    else
      @postings=Posting.all
    end
  end
  def show
    @posting=Posting.find(params[:id])
  end
  def new
    @provider = Provider.find(params[:provider_id])
    @posting = @provider.postings.new
  end
  def create
    @provider = current_user.provider
    @posting = @provider.postings.create!(posting_params)
    redirect_to posting_path(@posting)
  end
  def edit
    @posting = current_user.provider.postings.find(params[:id])
  end
  def update
    @provider = Provider.find(params[:provider_id])
    @posting = Posting.find(params[:id])
    @posting.update(posting_params.merge(user:current_user))
    redirect_to provider_path(@provider)
  end
  def destroy
    @posting = current_user.provider.postings.find(params[:id])
    # I really like using the active record associations you used to define the posting instance variable
    @posting.destroy
    redirect_to provider_path(current_user.provider)
  end
  private
  def posting_params
    params.require(:posting).permit(:title, :description, :timeframe, :pay)
  end

end
