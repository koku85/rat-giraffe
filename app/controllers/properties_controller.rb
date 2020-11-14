class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]


  def index
    @properties = Property.all
  end


  def show
    @nearest_stations = @property.nearest_stations
  end


  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def edit
    @property.nearest_stations.build
  end

  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_path, notice: '物件を登録しました！' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_path, notice: '物件を編集しました！' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_property
      @property = Property.find(params[:id])
    end


    def property_params
      params.require(:property).permit(:property_name, :rent, :address, :age, :remarks,
      nearest_stations_attributes: [:line_name, :station_name, :minutes_walk, :property_id, :id, :_destroy,],
      )
    end
end
