class ImageSetsController < ApplicationController
  before_filter :logged_in?
  # GET /image_sets
  # GET /image_sets.xml
  def index
    @image_sets = ImageSet.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @image_sets }
    end
  end

  # GET /image_sets/1
  # GET /image_sets/1.xml
  def show
    @image_set = ImageSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image_set }
    end
  end

  # GET /image_sets/new
  # GET /image_sets/new.xml
  def new
    @image_set = ImageSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image_set }
    end
  end

  # GET /image_sets/1/edit
  def edit
    @image_set = ImageSet.find(params[:id])
  end

  # POST /image_sets
  # POST /image_sets.xml
  def create
    @image_set = ImageSet.new(params[:image_set])

    respond_to do |format|
      if @image_set.save
        flash[:notice] = 'ImageSet was successfully created.'
        format.html { redirect_to(@image_set) }
        format.xml  { render :xml => @image_set, :status => :created, :location => @image_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /image_sets/1
  # PUT /image_sets/1.xml
  def update
    @image_set = ImageSet.find(params[:id])

    respond_to do |format|
      if @image_set.update_attributes(params[:image_set])
        flash[:notice] = 'ImageSet was successfully updated.'
        format.html { redirect_to(@image_set) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /image_sets/1
  # DELETE /image_sets/1.xml
  def destroy
    @image_set = ImageSet.find(params[:id])
    @image_set.destroy

    respond_to do |format|
      format.html { redirect_to(image_sets_url) }
      format.xml  { head :ok }
    end
  end
end
