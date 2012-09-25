class StationsController < ApplicationController
  before_filter do |c|
    c.send(:user_authorized?, :edit_stations)
  end

  before_filter :event_selected?
  
  # assigning a trap speed to an entrant
  #Parameters: {.. "entrant_id"=>"2", "trap_speed_id"=>"1", "id"=>"1", "trap_num"=>"1", "commit"=>"Commit"}
  def update_run_data
    @station = Station.find(params[:id])
    trap_num = params[:trap_num]
    trap_speed = TrapSpeed.find(params[:trap_speed_id])

    entrant = nil
    if params.has_key?(:vehicle_number)
      entrant = Entrant.find(:first, :conditions => "number = '#{params[:vehicle_number]}'")
    elsif params.has_key?(:entrant_id)
      entrant = Entrant.find(params[:entrant_id])
    end

    if entrant == nil and ! params.has_key?(:mark_invalid)
      flash[:error] = "I can't find that number"
      redirect_to @station, :error => flash[:error]
      return
    end

    invalid_flag = false
    invalid_flag = true if params.has_key?(:mark_invalid)
    official_flag = true
    official_flag = false if invalid_flag
    dup_flag = false
    dnf_flag = false
    dnf_flag = true if params.has_key?(:force_dnf)
    comment = String.new
    comment = params[:comment] if params.has_key?(:comment)

    trap_speed.station_id = @station.id
    trap_speed.invalid_flag = invalid_flag
    trap_speed.official_flag = official_flag
    trap_speed.dup_flag = dup_flag
    trap_speed.trap_num = trap_num
    trap_speed.force_dnf = dnf_flag
    trap_speed.comment = comment
    trap_speed.trapid = @station.trapid_1 if trap_num.to_i == 1
    trap_speed.trapid = @station.trapid_2 if trap_num.to_i == 2
    trap_speed.trapid = @station.trapid_3 if trap_num.to_i == 3
    trap_speed.trapid = @station.trapid_4 if trap_num.to_i == 4
    trap_speed.entrant_id = entrant.id if entrant != nil
    trap_speed.entrant_id = nil if invalid_flag
    if ! trap_speed.save
      flash[:error] = "Error - unable to save trap speed"
      redirect_to @station
      return
    end
    flash[:notice] = "Saved Trap Speed!"
    flash[:notice] = "Saved run as DNF" if dnf_flag
    @station.order_data(trap_speed)
    redirect_to @station, :notice => flash[:notice]
    #trap_div = "trap_#{@trap_num}_div"
    #render :partial => 'update_trap', :content_type => 'text/html'
    #respond_to do |format|
    #  format.js
    #end
    #render do |page|
    #  page.replace_html trap_div, :partial => 'update_trap'
    #end
  end

  # updates the trap pending div 
  def update_trap_pending
    @station = Station.find(params[:id])
    @trap_num = params[:trap_num]
    @pending_trap_count = @station.trap_speeds.count(:all,
                                             :conditions => "entrant_id is NULL AND trap_num is NULL AND dup_flag = 0 AND invalid_flag = 0",
                                             :order => "capture_time ASC")
    
    render :partial => 'update_trap_pending', :content_type => 'text/html'
  end

  # updates the trap div 
  def update_trap
    @station = Station.find(params[:id])
    @trap_num = params[:trap_num]
    @trap_speeds = @station.trap_speeds.find(:all,
                                             :conditions => "entrant_id is NULL AND trap_num is NULL AND dup_flag = 0 AND invalid_flag = 0",
                                             :order => "capture_time ASC")
    @last_trap_id = 0
    @last_trap_id = @trap_speeds.last.id if @trap_speeds.length > 0

    @entrant_on_deck = nil
    if params.has_key?(:on_deck_id) and params[:on_deck_id].length > 0
      # update the on deck data
      @entrant_on_deck = Entrant.find(params[:on_deck_id])
      if @entrant_on_deck == nil
        flash[:error] = "Could not find entrant for vehicle # #{params[:on_deck_id]}"
      end
    end
    @update_interval = 250000
    @update_interval = 300000 if @trap_speeds.length > 0
logger.info "setting trap update to #{@update_interval}"
    render :partial => 'update_trap' #, :content_type => 'text/html'
  end

  # updates the trap div 
  def update_on_deck
    @station = Station.find(params[:id])
logger.info "==============at start = #{params[:on_deck_entrant]}"
    if ! params.has_key?(:on_deck_entrant) or params[:on_deck_entrant].length < 1
logger.info "============= INVALID param for entrant"
      redirect_to @station
      return
    end
    
    @entrant_on_deck = Entrant.find(:first, :conditions => "number = '#{params[:on_deck_entrant]}'")
logger.info "entrant found = #{@entrant_on_deck}"
    if @entrant_on_deck == nil
      flash[:error] = "Could not find entrant for vehicle # #{params[:on_deck_entrant]}"
logger.info "-=-=-=-=-=-=-=-=-=- !!!!!!!!!!! going to alert #{flash.inspect}"
      #redirect_to station_path(@station), :error => "Could not find entrant for vehicle # #{params[:on_deck_entrant]}"
redirect_to "/stations/#{@station.id}"
#respond_to do |format|
#  format.html { render action: "show" }
#end
      return
    end
logger.info "updating on deck entrant to #{@entrant_on_deck.id}"
    redirect_to "/stations/#{@station.id}?on_deck_entrant_id=#{@entrant_on_deck.id}"
  end
  
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
logger.info "====-=-=-=-=-=-=-=- #{flash.inspect}"
    @entrant_on_deck = nil
    if params.has_key?(:on_deck_entrant_id) and params[:on_deck_entrant_id].length > 0
      # update the on deck data
      @entrant_on_deck = Entrant.find(params[:on_deck_entrant_id])
      if @entrant_on_deck == nil
        flash[:error] = "Could not find entrant for vehicle # #{params[:on_deck_entrant]}"
      end
    end
logger.info "HERE _+_+_+_+_+_+_+_+_+__+_+_+_+_+__+"
logger.info "on deck entrant id = #{@entrant_on_deck.id}" if @entrant_on_deck != nil
logger.info "NO on deck entrant" if @entrant_on_deck == nil
    respond_to do |format|
      format.html  # show.html.erb
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
    if current_event == nil or @station.event != current_event
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
