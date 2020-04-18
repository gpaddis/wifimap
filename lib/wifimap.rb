# frozen_string_literal: true

require 'wifimap/version'
require 'wifimap/parser/airodump'

module Wifimap
  class Error < StandardError; end

  # Parse the content of a dump file and return a hash of APs, stations and probes.
  def self.parse(file_content)
    case dump_format(file_content)
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

  # Check the file content and identify the dump format.
  def self.dump_format(file_content)
    airodump_header = 'BSSID, First time seen, Last time seen, channel, Speed, Privacy, Cipher, Authentication, Power'
    :airodump if file_content.include?(airodump_header)
  end
end
