class VehicleClassesController < ApplicationController
  before_filter do |c|
    c.send(:user_authorized?, :edit_vehicle_classes)
  end

  before_filter :event_selected?

  # GET /vehicle_classes
  # GET /vehicle_classes.json
  def index
    event_id = current_event.id
    event_id = params[:event_id] if params.has_key?(:event_id)
    @vehicle_classes = VehicleClass.all(:conditions => "event_id = #{event_id}", :order => "max_speed ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicle_classes }
    end
  end

  # GET /vehicle_classes/1
  # GET /vehicle_classes/1.json
  def show
    @vehicle_class = VehicleClass.find(params[:id])

    @trap_speeds = Array.new
    temp_speeds = nil
    @vehicle_class.entrants.each do |e|
      if temp_speeds == nil
        temp_speeds = e.trap_speeds
      else
        temp_speeds += e.trap_speeds
      end
    end
    if temp_speeds != nil and temp_speeds.length > 0
      temp_speeds_2 = temp_speeds.sort {|a,b| a.speed <=> b.speed }.reverse
      if params.has_key?(:display_type) and params[:display_type] == 'fastest_run'
        entrant_ids = Array.new
        temp_speeds_2.each do |ts|
          next if entrant_ids.include?(ts.entrant.id)
          @trap_speeds.push(ts)
          entrant_ids.push(ts.entrant.id)
        end
      elsif params.has_key?(:display_type) and params[:display_type] == 'by_run_time'
        @trap_speeds = temp_speeds_2.sort { |a,b| a.capture_time <=> b.capture_time }
      else
        @trap_speeds = temp_speeds_2
      end
  end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle_class }
    end
  end

  # GET /vehicle_classes/new
  # GET /vehicle_classes/new.json
  def new
    @vehicle_class = VehicleClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle_class }
    end
  end

  # GET /vehicle_classes/1/edit
  def edit
    @vehicle_class = VehicleClass.find(params[:id])

    if current_event == nil or @vehicle_class.event != current_event
      flash[:error] = "Attempting to edit a vehicle class from a different event (#{@vehicle_class.event.name})"
      redirect_to root_url
      return
    end
  end

  # POST /vehicle_classes
  # POST /vehicle_classes.json
  def create
    @vehicle_class = VehicleClass.new(params[:vehicle_class])

    respond_to do |format|
      if @vehicle_class.save
        format.html { redirect_to @vehicle_class, notice: 'Vehicle class was successfully created.' }
        format.json { render json: @vehicle_class, status: :created, location: @vehicle_class }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vehicle_classes/1
  # PUT /vehicle_classes/1.json
  def update
    @vehicle_class = VehicleClass.find(params[:id])

    respond_to do |format|
      if @vehicle_class.update_attributes(params[:vehicle_class])
        format.html { redirect_to @vehicle_class, notice: 'Vehicle class was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_classes/1
  # DELETE /vehicle_classes/1.json
  def destroy
    @vehicle_class = VehicleClass.find(params[:id])
    @vehicle_class.destroy

    respond_to do |format|
      format.html { redirect_to vehicle_classes_url }
      format.json { head :ok }
    end
  end
end
