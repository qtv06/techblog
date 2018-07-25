class PostClipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    post_clip_saved = PostClip.saved_by(@post.id, current_user.id)
    if post_clip_saved.present?
      PostClip.destroy(post_clip_saved.first.id)
    else
      @post_clip = current_user.post_clips.build()
      @post_clip.post = @post
      if @post_clip.save
        flash[:success] = "Saved"
      else
        flash[:danger] = "Some thing wrong"
      end
    end

    respond_to do |f|
      f.html{ redirect_to post_path @post}
    end
  end

  private

  def find_post
    @post = Post.find_by id: params[:post_id]
    redirect_to root_path if @post.blank?
  end
end
