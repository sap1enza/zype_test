# frozen_string_literal: true

require 'rails_helper'

describe Api::ZypeService do
  let(:service) { described_class.new }

  let(:valid_subscription_username) { 'test@test.com' }
  let(:without_subscription_username) { 'test2@test.com' }
  let(:password) { 'password' }

  describe '#authenticate!' do
    context 'with correct credentials' do
      it 'stores token on redis' do
        VCR.use_cassette('services/api/zype_service_authenticate_success') do
          response = service.authenticate!(valid_subscription_username, password)

          expect(response.message).to eq('OK')
        end
      end
    end

    context 'with wrong credentials' do
      it 'stores token on redis' do
        VCR.use_cassette('services/api/zype_service_authenticate_error') do
          response = service.authenticate!(valid_subscription_username, '123')

          expect(response.message).to eq('Unauthorized')
        end
      end
    end
  end
end
