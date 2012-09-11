# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout 'default'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :set_lists

  before_filter :authorize, :except => [:login, :index]
#  before_filter :authorize_admin, :only => [:destroy]

  protected

  def set_lists
    @all_submissions = Submission.find(:all)
    @most_liked = @all_submissions.sort_by{|s| s.thumbs.size}.reverse[0..2]
    @most_commented = @all_submissions.sort_by{|s| s.comments.size}.reverse[0..2]

    @most_recent = Submission.find(:all, 
                                         :order => "created_at DESC",
                                         :limit => 3)


    @most_recent_projects = Project.find(:all, 
                                         :order => "created_at DESC",
                                         :limit => 3)

    @most_recent_comments = Comment.find(:all, 
                                         :order => "created_at DESC",
                                         :limit => 3)

    @people_with_most_bonuses = User.find(:all).sort_by{|u| u.bonus_score}.reverse[0..2]

  end

  def authorize 
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.fullpath
      flash[:notice] = "Please log in."
       redirect_to :controller => 'studio', :action => 'login'
    end
  end

  def authorize_admin
    user = User.find_by_id(session[:user_id])
    if ! user.nil?
      unless user.role == "Admin" || user.role == "Instructor"
			 flash[:notice] = "You have to be an instructor for this action."
       redirect_to :controller => 'studio', :action => 'login'
      end
    else
      session[:original_uri] = request.fullpath
      flash[:notice] = "Please log in."
       redirect_to :controller => 'studio', :action => 'login'
    end
  end

end
