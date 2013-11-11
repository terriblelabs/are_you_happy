require 'open-uri'

class QuotesController < ApplicationController
  def show
    render json: formatted_quote
  end

  private

  def formatted_quote
    source = CGI.escape(ENV['QUOTE_SOURCE'])
    url = "http://www.iheartquotes.com/api/v1/random.json?source=#{source}&max_characters=200"
    quote = JSON.parse(open(url).read)['quote']

    quote.split("\n").map(&:strip).reject(&:blank?).map{|line| "<p>#{line}</p>"}
  end
end
