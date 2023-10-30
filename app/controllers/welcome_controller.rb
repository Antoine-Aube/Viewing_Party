# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @users = User.all
    # @top_movies = facade.top_20_movies
  end

  private

  def facade
    MovieFacade.new(nil)
  end
end
