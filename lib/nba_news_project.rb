require_relative "./nba_news_project/version"
require_relative "nba_news_project/cli"
require_relative "nba_news_project/category"
require_relative "nba_news_project/scraper"

require 'pry'
require 'nokogiri'

module NbaNewsProject
  class Error < StandardError; end
  # Your code goes here...
end
