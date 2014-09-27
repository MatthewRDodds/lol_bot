require 'yaml'

config = <<-YAML
---
:nick: lol_bot
:irc_port: 6667
:server: irc.freenode.org
:channels:
- #bot_test_mbot
- #collegeplus
- bot_test_mbot
- collegeplus
:fifo:
  :path: /tmp/fifo
  :mode: 0666
:history:
  :mode: :max_messages
  :max_messages: 10
  :time_format: '%H:%M'
YAML

CONFIG ||= YAML.load config
