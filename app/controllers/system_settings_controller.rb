class SystemSettingsController < ApplicationController
  before_filter :except => :index do |c|
    c.send(:user_authorized?, :edit_system_settings)
  end

  # GET /system_settings
  # GET /system_settings.json
  # This is the home page, as there is only a single system setting
  def index
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /system_settings/1
  # GET /system_settings/1.json
  def show
    @system_setting = SystemSetting.first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @system_setting }
    end
  end

  # GET /system_settings/new
  # GET /system_settings/new.json
  def new
    @system_setting = SystemSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system_setting }
    end
  end

  # GET /system_settings/1/edit
  def edit
    @system_setting = SystemSetting.first
  end

  # POST /system_settings
  # POST /system_settings.json
  def create
    @system_setting = SystemSetting.new(params[:system_setting])

    respond_to do |format|
      if @system_setting.save
        format.html { redirect_to @system_setting, notice: 'System setting was successfully created.' }
        format.json { render json: @system_setting, status: :created, location: @system_setting }
      else
        format.html { render action: "new" }
        format.json { render json: @system_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /system_settings/1
  # PUT /system_settings/1.json
  def update
    @system_setting = SystemSetting.find(params[:id])

    respond_to do |format|
      if @system_setting.update_attributes(params[:system_setting])
        format.html { redirect_to @system_setting, notice: 'System setting was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @system_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_settings/1
  # DELETE /system_settings/1.json
  def destroy
    @system_setting = SystemSetting.find(params[:id])
    @system_setting.destroy

    respond_to do |format|
      format.html { redirect_to system_settings_url }
      format.json { head :ok }
    end
  end
end
