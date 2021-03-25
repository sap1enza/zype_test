# frozen_string_literal: true

module Api
  class ZypeService < BaseService
    attr_reader :access_token

    def initialize(access_token = nil)
      @access_token = access_token
    end

    def authenticate!(username, password)
      params = {
        client_id: ENV['ZYPE_CLIENT_ID'],
        client_secret: ENV['ZYPE_CLIENT_SECRET'],
        username: username,
        grant_type: 'password',
        password: password
      }.to_query

      response = client(:post, "#{settings.auth_url}?#{params}")

      parsed_response(response)
    end

    def videos(**params)
      query_params = params.merge(
        order: 'desc',
        sort: 'created_at'
      ).to_query

      client(:get, "#{settings.base_url}/videos?#{authorization_params}&#{query_params}").parsed_response
    end

    def embed_player_url(video_id)
      "#{settings.player_url}/embed/#{video_id}.html?#{authorization_params}"
    end

    private

    def parsed_response(response)
      OpenStruct.new(
        message: response.message,
        success: response.success?,
        access_token: response['access_token'],
        expires_in: response['expires_in']
      )
    end

    def settings
      OpenStruct.new(
        base_url: settings_file.fetch('base_url'),
        auth_url: settings_file.fetch('auth_url'),
        player_url: settings_file.fetch('player_url'),
        app_key: settings_file.fetch('app_key'),
        player_key: settings_file.fetch('player_key')
      )
    end

    def authorization_params
      return { access_token: access_token }.to_query if access_token

      { app_key: settings.app_key }.to_query
    end

    def settings_filepath
      Rails.root.join('config/zype_api.yml')
    end
  end
end
