# frozen_string_literal: true

module PlayerHelper
  def zype_embed_player(video_id)
    embed_url = Api::ZypeService.new(current_user_token).embed_player_url(video_id)

    "<iframe src='#{embed_url}' width='500px' height='280px'>".html_safe
  end
end
