class SourceCodeFilesController < ApplicationController
  # GET /source_code_files
  # GET /source_code_files.xml
  def index
    @source_code_files = SourceCodeFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @source_code_files }
    end
  end

  # GET /source_code_files/1
  # GET /source_code_files/1.xml
  def show
    @source_code_file = SourceCodeFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @source_code_file }
    end
  end

  # GET /source_code_files/new
  # GET /source_code_files/new.xml
  def new
    @source_code_file = SourceCodeFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @source_code_file }
    end
  end

  # GET /source_code_files/1/edit
  def edit
    @source_code_file = SourceCodeFile.find(params[:id])
  end

  # POST /source_code_files
  # POST /source_code_files.xml
  def create
    @source_code_file = SourceCodeFile.new(params[:source_code_file])

    respond_to do |format|
      if @source_code_file.save
        format.html { redirect_to(@source_code_file, :notice => 'SourceCodeFile was successfully created.') }
        format.xml  { render :xml => @source_code_file, :status => :created, :location => @source_code_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @source_code_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /source_code_files/1
  # PUT /source_code_files/1.xml
  def update
    @source_code_file = SourceCodeFile.find(params[:id])

    respond_to do |format|
      if @source_code_file.update_attributes(params[:source_code_file])
        format.html { redirect_to(@source_code_file, :notice => 'SourceCodeFile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @source_code_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /source_code_files/1
  # DELETE /source_code_files/1.xml
  def destroy
    @source_code_file = SourceCodeFile.find(params[:id])
    @source_code_file.destroy

    respond_to do |format|
      format.html { redirect_to(source_code_files_url) }
      format.xml  { head :ok }
    end
  end
end
