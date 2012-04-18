class EntrantsController < ApplicationController
  before_filter :only => [:destroy, :edit, :new] do |c|
    c.send(:user_authorized?, :edit_entrants)
  end

  before_filter :event_selected?
  
  # GET /entrants
  # GET /entrants.json
  def index
    event_id = current_event.id
    event_id = params[:event_id] if params.has_key?(:event_id)
    @entrants = Entrant.all(:conditions => "event_id = #{event_id}",
                            :order => "number ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entrants }
    end
  end

  # GET /entrants/1
  # GET /entrants/1.json
  def show
    @entrant = Entrant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entrant }
    end
  end

  # GET /entrants/new
  # GET /entrants/new.json
  def new
    @entrant = Entrant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entrant }
    end
  end

  # GET /entrants/1/edit
  def edit
    @entrant = Entrant.find(params[:id])

    if current_event == nil or @entrant.event != current_event
      flash[:error] = "Attempting to edit an Entrant from a different event (#{@entrant.event.name})"
      redirect_to root_url
      return
    end
      
  end

  # POST /entrants
  # POST /entrants.json
  def create
    @entrant = Entrant.new(params[:entrant])

    respond_to do |format|
      if @entrant.save
        format.html { redirect_to @entrant, notice: 'Entrant was successfully created.' }
        format.json { render json: @entrant, status: :created, location: @entrant }
      else
        format.html { render action: "new" }
        format.json { render json: @entrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entrants/1
  # PUT /entrants/1.json
  def update
    @entrant = Entrant.find(params[:id])

    respond_to do |format|
      if @entrant.update_attributes(params[:entrant])
        format.html { redirect_to @entrant, notice: 'Entrant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @entrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrants/1
  # DELETE /entrants/1.json
  def destroy
    @entrant = Entrant.find(params[:id])
    @entrant.destroy

    respond_to do |format|
      format.html { redirect_to entrants_url }
      format.json { head :ok }
    end
  end
end
