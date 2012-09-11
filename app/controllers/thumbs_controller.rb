class ThumbsController < ApplicationController
  # GET /thumbs
  # GET /thumbs.xml
  def index
    @thumbs = Thumb.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thumbs }
    end
  end

  # GET /thumbs/1
  # GET /thumbs/1.xml
  def show
    @thumb = Thumb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thumb }
    end
  end

  # GET /thumbs/new
  # GET /thumbs/new.xml
  def new
    @thumb = Thumb.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thumb }
    end
  end

  # GET /thumbs/1/edit
  def edit
    @thumb = Thumb.find(params[:id])
  end

  # POST /thumbs
  # POST /thumbs.xml
  def create
    @thumb = Thumb.new(params[:thumb])

    respond_to do |format|
      if @thumb.save
        format.html { redirect_to(@thumb, :notice => 'Thumb was successfully created.') }
        format.xml  { render :xml => @thumb, :status => :created, :location => @thumb }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thumb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # POST /thumbs
  # POST /thumbs.xml
  def up
    @thumb = Thumb.new(:user_id => params[:user_id], :submission_id => params[:submission_id])

    respond_to do |format|
      if @thumb.save
        format.html { redirect_to( :back, :notice => 'Thumb was successfully updated.') }
#        format.html { redirect_to(@thumb, :notice => 'Thumb was successfully updated.') }
      else
        format.html { render :action => "new" }
      end
    end
  end


  # PUT /thumbs/1
  # PUT /thumbs/1.xml
  def update
    @thumb = Thumb.find(params[:id])

    respond_to do |format|
      if @thumb.update_attributes(params[:thumb])
        format.html { redirect_to(@thumb, :notice => 'Thumb was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thumb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thumbs/1
  # DELETE /thumbs/1.xml
  def destroy
    @thumb = Thumb.find(params[:id])
    @thumb.destroy

    respond_to do |format|
      format.html { redirect_to(thumbs_url) }
      format.xml  { head :ok }
    end
  end
end
