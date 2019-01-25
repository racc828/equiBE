class Api::V1::ConversionsController < ApplicationController

  def create_conversion
    convertLatLng = Conversion.create(conversion_params)
    addressJson = {
      address: convertLatLng.address
    }
    render json: addressJson
  end

  private

 def conversion_params
    params.require(:conversion).permit(:latitude, :longitude)
  end

end
