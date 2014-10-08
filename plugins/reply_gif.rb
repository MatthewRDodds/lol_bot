require 'uri'
require 'json'
require 'net/http'

class Cinch::ReplyGif
  include Cinch::Plugin

  match /gif (.*)/

  def execute(msg, search)
    base_query = 'tag-operator=and&api-key=39YAprx5Yi'
    uri = URI('http://replygif.net')
    uri.path = '/api/gifs'
    uri.query = base_query << '&' + 'tag=' + URI.encode(search).to_s.strip
    response = Net::HTTP.get uri
    sample = JSON.parse(response).sample
    msg.reply(sample['file'].to_s) if sample
  end
end
