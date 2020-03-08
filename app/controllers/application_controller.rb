class ApplicationController < ActionController::Base

 helper_method :current_user, :logged_in?, :search_results

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def search_results
    unless params[:q].nil? || params[:q].empty?
      @input = params[:q].downcase
      @results = []
      Article.all.each do |article|
        @results << article if article.title.downcase.include?(@input) ||
           article.description.downcase.include?(@input)
       end
       @results
    else
      Article.paginate(page: params[:page], per_page: 5)
    end
  end
end
