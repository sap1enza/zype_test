# frozen_string_literal: true

require 'rails_helper'

describe Api::BaseService do
  let(:service) { described_class.new }

  describe '#client' do
    context 'with no arguments' do
      it 'raise error' do
        expect { service.client }.to raise_error(ArgumentError)
      end
    end

    context 'with correct arguments' do
      it 'makes request call' do
        VCR.use_cassette('services/api/base_service_client_success') do
          sample_api = 'https://swapi.dev/api/people/1'
          response   = service.client(:get, sample_api)

          expect(response.success?).to eq(true)
          expect(response['name']).to eq('Luke Skywalker')
        end
      end
    end
  end
end
