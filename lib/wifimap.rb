# frozen_string_literal: true

require 'wifimap/version'
require 'wifimap/parser_factory'

module Wifimap
  class Error < StandardError; end

  # Parse the content of a dump file and return a parser instance.
  def self.parse(file_content)
    Wifimap::ParserFactory.create(file_content)
  end

  # A wrapper on .parse to read directly from a file.
  def self.parse_file(filename)
    file_content = File.read(filename)
    parse(file_content)
  end
end
