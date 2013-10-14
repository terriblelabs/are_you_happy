require 'open-uri'

class QuotesController < ApplicationController
  def show
    source = CGI.escape(ENV['QUOTE_SOURCE'])
    url = "http://www.iheartquotes.com/api/v1/random.json?source=#{source}&max_characters=200"
    response = open(url).read
    render json: response
  end
end