class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.xml

  before_filter :authorize_admin, :except => [:index]

  def index
    @attendances = Attendance.find(:all, :order => "date DESC")
    @users = User.all.sort! { |a, b| a.attendances.size <=> b.attendances.size }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.xml
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.xml
  def new
    date = Date.today
    user = User.find(session[:user_id])

    logger.info("Entering attendance new..")
    logger.info("date: " + date.to_s)
    logger.info("user_id: " + session[:user_id].to_s)
    logger.info("user: " + user.account_name)

    @attendance = Attendance.new

    @attendance.date = date
    @attendance.user = user

    @users = User.find(:all, :order => "first_name, last_name")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.xml
  def create
    @attendance = Attendance.new(params[:attendance])

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to(:action => :index, :notice => 'Attendance was successfully created.') }
        format.xml  { render :xml => @attendance, :status => :created, :location => @attendance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.xml
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to(@attendance, :notice => 'Attendance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.xml
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to(attendances_url) }
      format.xml  { head :ok }
    end
  end
end
