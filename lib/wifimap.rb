# frozen_string_literal: true

require 'wifimap/version'
require 'wifimap/parser'
require 'wifimap/parser/airodump'

module Wifimap
  class Error < StandardError; end

  # Parse the content of a dump file and return a hash of APs, stations and probes.
  def self.parse(file_content)
    case Wifimap::Parser.dump_format(file_content)
    when :airodump
      Wifimap::Parser::Airodump.new(file_content)
    else
      raise Error, 'Unsupported dump format'
    end
  end

  # A wrapper on .parse to read directly from a file.
  def self.parse_file(filename)
    file_content = File.read(filename)
    parse(file_content)
  end
end
