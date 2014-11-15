require 'uri'
require 'json'
require 'net/http'

require_relative '../data/tags.rb'

class Cinch::ReplyGif
  include Cinch::Plugin

  match /gif (.*)/

  def execute(msg, search)
    if search.match('help')
      msg.reply(help_text) and return
    end

    response = Net::HTTP.get uri
    sample = JSON.parse(response).sample
    msg.reply(sample['file'].to_s) if sample
  end

  private

  def uri(base_query = 'tag-operator=and&api-key=39YAprx5Yi')
    uri = URI('http://replygif.net/api/gifs')
    uri.query = base_query << '&' + 'tag=' + URI.encode(search).to_s.strip
    uri
  end

  def help_text
    'Supported Tags: ' + TAGS.join(', ')
  end
end
