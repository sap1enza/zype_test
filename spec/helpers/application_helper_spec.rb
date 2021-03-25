# frozen_string_literal: true

require 'rails_helper'

describe ApplicationHelper do
  describe '#authenticated?' do
    context 'when token exists' do
      before { allow(helper).to receive(:current_user_token).and_return('foo') }

      it 'returns true' do
        expect(helper.authenticated?).to eq(true)
      end
    end

    context 'when token do not exist' do
      before { allow(helper).to receive(:current_user_token).and_return(nil) }

      it 'returns true' do
        expect(helper.authenticated?).to eq(false)
      end
    end
  end
end
