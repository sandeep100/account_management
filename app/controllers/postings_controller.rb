class PostingsController < ApplicationController
  def new
    @posting = Posting.new
    @row_id = params[:row_id].to_i
    respond_to :js
  end
end
