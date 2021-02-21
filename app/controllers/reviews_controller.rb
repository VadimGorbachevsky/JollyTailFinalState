class ReviewsController < ApplicationController

  before_action :find_review, only: [:edit, :show, :update, :destroy]

  def index
    @reviews = Review.where(real: true);
  end

  def show
    redirect_to _403_url
  end

  def create
    Review.create(user_id: current_user.id, title: params[:review][:title], body: params[:review][:body])
    flash[:notice] = "Спасибо, мы получили ваш отзыв. Если вы не ругались матом, то скоро он будет опубликован."
    redirect_to reviews_path
  end

  def edit
    redirect_to _403_url
  end

  def destroy
  end

  def update
    redirect_to _403_url
  end


  def review_params
    params.require(:review).permit(:id, :user_id, :title, :body, :answer)
  end

  def find_review
    @review = Review.find(params[:id])
    if @review == nil
      redirect_to _403_url
    end
  end

end
