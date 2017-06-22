class DeclarationsController < ApplicationController
  def index
  end

  def add
    if Rails.env.development?
      # Fake IP address in development because otherwise 127.0.0.1
      # OraHQ Public IP Adress
      ip_address = '101.98.110.75'
    else
      ip_address = request.remote_ip
    end

    response = RestClient.get("https://freegeoip.net/json/#{ip_address}")
    response_object = JSON.load(response)

    Declaration.create!(
      ip_address: response_object.fetch('ip'),
      city: response_object.fetch('city'),
      country_name: response_object.fetch('country_name'),
      country_code: response_object.fetch('country_code'),
      latitude: response_object.fetch('latitude'),
      longitude: response_object.fetch('longitude'),
      time_zone: response_object.fetch('time_zone')
    )

    redirect_to declarations_path
  end
end
