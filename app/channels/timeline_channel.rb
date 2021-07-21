class TimelineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "timeline:#{current_user.group}"
    stream_from "repost:#{current_user.group}"
    stream_from "like"
  end
end
