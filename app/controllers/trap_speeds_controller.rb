class TrapSpeedsController < ApplicationController
  before_filter :except => :submit_speed_data do |c|
    c.send(:user_authorized?, :edit_trap_speeds)
  end

  before_filter :event_selected? 

  def update_live_data
    @trap_speeds = Array.new
    @data_type = 'live'
    @data_type = params[:data_type] if params.has_key?(:data_type)
    if @data_type == 'live'
      @trap_speeds = current_event.trap_speeds.find(:all, :conditions => "entrant_id is NOT NULL", :order => "capture_time DESC", :limit => 10)
    elsif @data_type == 'fastest_overall'
      temp_speeds = current_event.trap_speeds.find(:all, :conditions => "entrant_id is NOT NULL", :order => "speed DESC")
      entrant_ids = Array.new
      temp_speeds.each do |ts|
        next if entrant_ids.include?(ts.entrant.id)
        @trap_speeds.push(ts)
        entrant_ids.push(ts.entrant.id)
      end
    end   
    
    render :partial => 'update_live_data', :content_type => 'text/html'
  end

  # ?time_data=123456789&speed_data=152.5&scode=1&trapid=1m
  def submit_speed_data
    if ! params.has_key?(:scode) or ! params.has_key?(:time_data) or
              ! params.has_key?(:speed_data) or params[:scode] !~ /^[A-Z0-9]+$/ or
              params[:time_data].sub(/^([0-9]+)$/, '\1').length > 10 or
              ! params.has_key?(:trapid)
        render :xml => "ERROR:::Invalid input"
      return
    end

    station = Station.find(:first, :conditions => "station_code = '#{params[:scode]}'")
    if station == nil
      render :xml => "ERROR"
      return
    end

    time_data = params[:time_data].to_i
    speed_data = params[:speed_data].to_f
    
    trap_speed = TrapSpeed.new(:event_id => current_event.id,
                               :station_id => station.id,
                               :entrant_id => nil,
                               :trapid => nil,
                               :trap_num => nil,
                               :dup_flag => false,
                               :official_flag => false,
                               :invalid_flag => false,
                               :speed => speed_data,
                               :capture_time => time_data)
    if !trap_speed.save
      render :xml => "SAVE_ERROR"
      return
    end

    trap_speed.station.order_data trap_speed
    
    render :xml => "OK"
  end

  # GET /trap_speeds
  # GET /trap_speeds.json
  def index
    event_id = current_event.id
    event_id = params[:event_id] if params.has_key?(:event_id)
    @trap_speeds = TrapSpeed.all(:conditions => "event_id = #{event_id}")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trap_speeds }
    end
  end

  # GET /trap_speeds/1
  # GET /trap_speeds/1.json
  def show
    @trap_speed = TrapSpeed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trap_speed }
    end
  end

  # GET /trap_speeds/new
  # GET /trap_speeds/new.json
  def new
    @trap_speed = TrapSpeed.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trap_speed }
    end
  end

  # GET /trap_speeds/1/edit
  def edit
    @trap_speed = TrapSpeed.find(params[:id])
    if current_event == nil or @trap_speed.event != current_event
      flash[:error] = "Attempting to edit trap speed from a different event (#{@trap_speed.event.name})"
      redirect_to root_url
      return
    end
  end

  # POST /trap_speeds
  # POST /trap_speeds.json
  def create
    @trap_speed = TrapSpeed.new(params[:trap_speed])

    respond_to do |format|
      if @trap_speed.save
        format.html { redirect_to @trap_speed, notice: 'Trap speed was successfully created.' }
        format.json { render json: @trap_speed, status: :created, location: @trap_speed }
      else
        format.html { render action: "new" }
        format.json { render json: @trap_speed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trap_speeds/1
  # PUT /trap_speeds/1.json
  def update
    @trap_speed = TrapSpeed.find(params[:id])

    respond_to do |format|
      if @trap_speed.update_attributes(params[:trap_speed])
        format.html { redirect_to @trap_speed, notice: 'Trap speed was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @trap_speed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trap_speeds/1
  # DELETE /trap_speeds/1.json
  def destroy
    @trap_speed = TrapSpeed.find(params[:id])
    @trap_speed.destroy

    respond_to do |format|
      format.html { redirect_to trap_speeds_url }
      format.json { head :ok }
    end
  end
end
