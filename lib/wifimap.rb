# frozen_string_literal: true

require 'wifimap/access_point'
require 'wifimap/mac'
require 'wifimap/parsable'
require 'wifimap/parser_factory'
require 'wifimap/station'
require 'wifimap/version'

require 'wifimap/parser/airodump'
require 'wifimap/parser/sniff_probes'

module Wifimap
  class Error < StandardError; end

  # Parse the content of a dump file and return a parser instance.
  #
  # @param [String] file_content
  # @return [Wifimap::Parser::*] a parser instance
  def self.parse(file_content)
    Wifimap::ParserFactory.create(file_content)
  end

  # A wrapper on .parse to read directly from a file.
  #
  # @param [String] filename
  # @return [Wifimap::Parser::*] a parser instance
  def self.parse_file(filename)
    file_content = File.read(filename)
    parse(file_content)
  end
end
