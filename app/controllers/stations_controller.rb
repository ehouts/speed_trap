class StationsController < ApplicationController
  before_filter do |c|
    c.send(:user_authorized?, :edit_stations)
  end

  before_filter :event_selected?
   
  # GET /stations
  # GET /stations.json
  def index
    event_id = current_event.id
    event_id = params[:event_id] if params.has_key?(:event_id)
    
    @stations = Station.all(:conditions => "event_id = #{event_id}")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stations }
    end
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    @station = Station.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.json
  def new
    @station = Station.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/1/edit
  def edit
    @station = Station.find(params[:id])
    if current_event == nil or @station.event != current_event.name
      flash[:error] = "Attempting to edit station from a different event (#{@station.event.name})"
      redirect_to root_url
      return
    end
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(params[:station])

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render json: @station, status: :created, location: @station }
      else
        format.html { render action: "new" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stations/1
  # PUT /stations/1.json
  def update
    @station = Station.find(params[:id])

    respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :ok }
    end
  end
end
