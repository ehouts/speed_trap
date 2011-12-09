class TrapSpeedsController < ApplicationController
  # GET /trap_speeds
  # GET /trap_speeds.json
  def index
    @trap_speeds = TrapSpeed.all

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
