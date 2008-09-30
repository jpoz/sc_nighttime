class WordsController < ApplicationController
  before_filter :logged_in?, :except => ['index', 'show'] 
  
  def index
    @kinds = Kind.find(:all)
    @words = {}
    @kinds.each do |k|
      @words[k.name] = Word.find_all_by_kind_id( k.id, :order => "created_at DESC")
    end
  end

  # GET /words/1
  # GET /words/1.xml
  def show
    @word = Word.find(params[:id])
    @words = Word.find_all_by_kind_id(@word.kind.id, :order => "created_at DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @words }
    end
  end

  # GET /words/new
  # GET /words/new.xml
  def new
    @words = Word.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @words }
    end
  end

  # GET /words/1/edit
  def edit
    @words = Word.find(params[:id])
  end

  # POST /words
  # POST /words.xml
  def create
    @words = Word.new(params[:word])

    respond_to do |format|
      if @words.save
        flash[:notice] = 'Word was successfully created.'
        format.html { redirect_to(@words) }
        # format.xml  { render :xml => @word, :status => :created, :location => @words }
      else
        format.html { render :action => "new" }
        # format.xml  { render :xml => @words.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /words/1
  # PUT /words/1.xml
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        flash[:notice] = 'Word was successfully updated.'
        format.html { redirect_to(@word) }
        # format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        # format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.xml
  def destroy
    @words = Word.find(params[:id])
    @words.destroy

    respond_to do |format|
      format.html { redirect_to(words_url) }
      format.xml  { head :ok }
    end
  end
  
  def blog
    @words = Word.find_all_by_kind_id(1)
    
  end
end
