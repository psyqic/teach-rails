class BonusesController < ApplicationController
  # GET /bonuses
  # GET /bonuses.xml
  def index
    @bonuses = Bonuse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bonuses }
    end
  end

  # GET /bonuses/1
  # GET /bonuses/1.xml
  def show
    @bonuse = Bonuse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bonuse }
    end
  end

  # GET /bonuses/new
  # GET /bonuses/new.xml
  def new
    @bonuse = Bonuse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bonuse }
    end
  end

  # GET /bonuses/1/edit
  def edit
    @bonuse = Bonuse.find(params[:id])
  end

  # POST /bonuses
  # POST /bonuses.xml
  def create
    @bonuse = Bonuse.new(params[:bonuse])

    respond_to do |format|
      if @bonuse.save
        format.html { redirect_to(@bonuse, :notice => 'Bonuse was successfully created.') }
        format.xml  { render :xml => @bonuse, :status => :created, :location => @bonuse }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bonuse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bonuses/1
  # PUT /bonuses/1.xml
  def update
    @bonuse = Bonuse.find(params[:id])

    respond_to do |format|
      if @bonuse.update_attributes(params[:bonuse])
        format.html { redirect_to(@bonuse, :notice => 'Bonuse was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bonuse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bonuses/1
  # DELETE /bonuses/1.xml
  def destroy
    @bonuse = Bonuse.find(params[:id])
    @bonuse.destroy

    respond_to do |format|
      format.html { redirect_to(bonuses_url) }
      format.xml  { head :ok }
    end
  end
end
