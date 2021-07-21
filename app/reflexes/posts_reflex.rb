# frozen_string_literal: true

class PostsReflex < ApplicationReflex
  def repost
    post = Post.find(element.dataset[:id])
    post.increment! :reposts_count
    cable_ready["repost:#{current_user.group}"].text_content(
      selector: "#post-#{post.id}-reposts",
      text: post.reposts_count
    ).broadcast
  end

  def like
    post = Post.find(element.dataset[:id])
    post.increment! :like_count
    cable_ready["like"].text_content(
      selector: "#post-#{post.id}-likes",
      # html: "<> #{post.like_count} </>"
      text: post.like_count
    ).broadcast
  end
end
