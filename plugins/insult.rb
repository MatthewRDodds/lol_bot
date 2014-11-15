require 'uri'
require 'json'
require 'net/http'

class Cinch::Insult
  include Cinch::Plugin

  match /insult (\w+)/

  def execute(msg, name)
    message = name.match('help') ? help_text : insult(name)
    msg.reply message
  end

  private

  def insult(name)
    response = JSON.parse Net::HTTP.get(URI('http://api.yomomma.info'))
    name + ', ' + response['joke']  
  end

  def help_text
    <<-HELP
      Supply a name and get back a random personalized yomomma joke:
        Example: !insult nik
    HELP
  end
end
