class StudioController < ApplicationController

  def index
    @projects = Project.find_all
  end

  def login
    if request.post?
      user = User.authenticate(params[:account_name], params[:password])
      if user
        session[:user_id] = user.id
        session[:account_name] = user.account_name
        uri = session[:original_uri]
        session[:original_uri] = nil
         if uri
           redirect_to uri
         else
          redirect_to :controller => 'studio', :action => 'index'
           #  redirect_to(uri.gsub('.syr.edu','.syr.edu/swt') || {:action => "index"})
         end

      else
        flash.now[:notice] = "Invalid account name/password combination."
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:account_name] = nil
    flash.now[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

end
