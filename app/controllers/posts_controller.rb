# frozen_string_literal: true

class PostsController < ApplicationController


  def show
    @post = Database::Posts::Find.call(params[:id])
    head 404 unless @post
  end

end
