# frozen_string_literal: true

module Api
  class BaseService
    include HTTParty

    def client(method, endpoint)
      HTTParty.send(method, endpoint)
    end

    private

    def settings
      raise NotImplementedError
    end

    def settings_file
      @settings_file ||= YAML.safe_load(ERB.new(File.read(settings_filepath)).result)
    end

    def settings_filepath
      raise NotImplementedError
    end
  end
end
