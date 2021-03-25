# frozen_string_literal: true

require 'rails_helper'

describe PlayerHelper do
  let(:valid_video_id) { '5f99b061f25e330001c1ae75' }
  let(:invalid_video_id) { 'foo' }

  describe '#zype_embed_player' do
    it 'returns embed html' do
      VCR.use_cassette('helpers/player_helper_success') do
        response = helper.zype_embed_player(valid_video_id)

        expected_embed_url = 'https://player.zype.com/embed/5f99b061f25e330001c1ae75.html?' \
          'app_key=XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf'

        expect(response).to include(expected_embed_url)
      end
    end
  end
end
