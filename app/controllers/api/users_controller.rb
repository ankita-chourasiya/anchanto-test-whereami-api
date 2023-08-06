# app/controllers/api/users_controller.rb

require 'httparty'

module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def index
      @users = User.all
      render json: @users, status: :ok
    end

    def show
      country_code = fetch_country_code(@user.ip_address)
      preferred_language = extract_preferred_language(request.headers['Accept-Language'])
      
      response_data = {
        ip_address: @user.ip_address,
        country_code: country_code,
        preferred_language: preferred_language
      }

      render json: response_data, status: :ok
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def fetch_country_code(ip_address)
      geolocation_api_key = 'YOUR_API_KEY'
      response = HTTParty.get("http://api.ipstack.com/#{ip_address}?access_key=#{geolocation_api_key}")
      response['country_code'] || nil
    rescue StandardError
      nil
    end

    def extract_preferred_language(accept_language_header)
      languages = accept_language_header.to_s.split(',').map do |language|
        lang, _q = language.split(';q=')
        lang.downcase
      end
      preferred_language = languages.max_by { |lang| languages.count(lang) }
      preferred_language.blank? ? nil : preferred_language
    end
  end
end
