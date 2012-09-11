class SubmissionsController < ApplicationController

  before_filter :authorize_admin, :only => [:destroy, :edit]

  # GET /submissions
  # GET /submissions.xml
  def index
    @submissions = Submission.all
    @users = User.all.sort! { |a,b| a.attendances.size <=> b.attendances.size }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.xml
  def show
    @submission = Submission.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.xml
  def new
    @submission = Submission.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end


  def deploy
    @submission = Submission.find(params[:id])
    @submission.save_tgz

    command = Rails.root.to_s + "/lib/deploy_tgz.sh " +
                 " #{@submission.tmp_file_path} #{@submission.tmp_port}"

    logger.info("Executing command: " + command)
    system command
    redirect_to("http://#{request.host}:" + @submission.tmp_port)
  end

  def stop
    @submission = Submission.find(params[:id])

    pid = `ps -e | grep 'rails' | grep #{@submission.tmp_port} | cut -f 1 -d ' '`
    system("kill -9 #{pid}")
    redirect_to :back
  end


  # POST /submissions
  # POST /submissions.xml
  def create

    user_id = params[:submission][:user_id]
    project_id = params[:submission][:project_id]

    @submission = Submission.new(params[:submission])
    last_submission = Submission.find(:first, 
                                  :conditions => [ "user_id = :user_id and project_id = :project_id", 
                                                  params[:submission] ],
                                  :order => "id DESC") 

    if last_submission.nil?
      @submission.version = 1
    else
      @submission.version = last_submission.version + 1
    end

    @submission.file_name = File.basename(params[:submission][:uploaded_file].original_filename).gsub(/[^\w._-]/,'')

    if @submission.file_name.match(/\.rb/)
      @submission.code = params[:submission][:uploaded_file].read    
    elsif @submission.file_name.match(/\.tgz/)
      @submission.tgz = params[:submission][:uploaded_file].read    
    end

    if @submission.save
      redirect_to(@submission, :notice => 'Submission was successfully created.') 
    else
      redirect_to(@submission, :notice => 'Error! Submission was not successfully created.')   end

    #respond_to do |fomat|
      #if @submission.save
        #format.html { redirect_to(@submission, :notice => 'Submission was successfully created.') }
        ##format.xml  { render :xml => @submission, :status => :created, :location => @submission }
      #else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      #end
    #end
  end

  # PUT /submissions/1
  # PUT /submissions/1.xml
  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to(@submission, :notice => 'Submission was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.xml
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
      format.xml  { head :ok }
    end
  end

  def like
    @submission = Submission.find(params[:id])

    # Check if the user already liked it.
    #
    if Thumb.find_all_by_user_id_and_submission_id(params[:user_id], @submission.id).size > 0
      already = true
    else
      @thumb = Thumb.new(:user_id => params[:user_id], 
                         :submission_id => @submission.id)
    end
        

    respond_to do |format|
      if already
        format.html { redirect_to( :back, :notice => 'You arealdy like this.') }
      elsif @thumb.save
        format.html { redirect_to( :back, :notice => 'Successfully updated.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def post
#    @submission = Submission.find(params[:id])
#    @submission.comments << params[:comment]
    puts "Here I am!"

    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(:back, :notice => 'Comment was successfully created.') }
      else
        format.html { redirect_to(:back, :notice => 'oh-oh.') }
      end
    end
  end
end

