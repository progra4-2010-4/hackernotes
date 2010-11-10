class NotesController < ApplicationController
  before_filter :authenticate_user!
  # GET /notes
  # GET /notes.xml
  def index
    #@notes = Note.where(:user_id=> current_user.id).order("created_at DESC")
    #en vez de escribirlo como arriba, usar mejor la asociación:
    @notes = current_user.notes.order "created_at DESC"
    @user = current_user
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml  => @notes }
      format.json { render :json => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    #@note = Note.find(params[:id])
    #es mejor restringir: http://guides.rubyonrails.org/security.html#privilege-escalation
    @note = current_user.notes.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    #@note = Note.find(params[:id])
    @note = current_user.notes.find params[:id]
  end

  # POST /notes
  # POST /notes.xml
  def create
    @note = Note.new(params[:note])
    @note.user = current_user
    respond_to do |format|
      if @note.save
        format.html { redirect_to(@note, :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    #@note = Note.find(params[:id])
    @note = current_user.notes.find params[:id]
    @note.user = current_user
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to(@note, :notice => 'Note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    #@note = Note.find(params[:id])
    @note = current_user.notes.find params[:id]
    @note.destroy 
    respond_to do |format|
      format.html { redirect_to(notes_url) }
      format.xml  { head :ok }
    end
  end
end
