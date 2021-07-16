# frozen_string_literal: true

class PostsReflex < ApplicationReflex

  def repost
    post = Post.find(element.dataset[:id])
    post.increment! :reposts_count
    cable_ready["timeline"].text_content(
      selector: "#post-#{post.id}-reposts",
      text: post.reposts_count
    ).broadcast
  end

  def like
    post = Post.find(element.dataset[:id])
    post.increment! :like_count
    cable_ready["timeline"].text_content(
      selector: "#post-#{post.id}-likes",
      text: post.like_count
    ).broadcast
  end
end
