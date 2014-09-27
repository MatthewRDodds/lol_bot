require "cinch"
require_relative "../config/config.rb"
require_relative "../plugins/fifo"
require_relative "../plugins/history"
require_relative "../plugins/vote"

cinch = Cinch::Bot.new do
  configure do |config|
    config.nick = CONFIG[:nick]
    config.server = CONFIG[:server]
    config.port = CONFIG[:irc_port].to_i
    config.channels = CONFIG[:channels]
    config.plugins.plugins = [Cinch::Fifo, Cinch::Vote, Cinch::History]
    config.plugins.options[Cinch::History] = CONFIG[:history]
    config.plugins.options[Cinch::Fifo] = CONFIG[:fifo]
  end

  trap "SIGINT" do
    bot.quit
  end
end

cinch.start
