require "cinch"
require_relative "../config/config.rb"
require_relative "../plugins/fifo"
require_relative "../plugins/history"
require_relative "../plugins/vote"
require_relative "../plugins/reply_gif"
require_relative "../plugins/insult"

cinch = Cinch::Bot.new do
  configure do |config|
    config.nick = CONFIG[:nick]
    config.server = CONFIG[:server]
    config.port = CONFIG[:irc_port].to_i
    config.channels = CONFIG[:channels]
    config.plugins.plugins = [Cinch::Fifo, Cinch::Vote, Cinch::History, Cinch::ReplyGif, Cinch::Insult]
    config.plugins.options[Cinch::History] = CONFIG[:history]
    config.plugins.options[Cinch::Fifo] = CONFIG[:fifo]
  end

  trap "SIGINT" do
    bot.quit
  end
end

cinch.start
