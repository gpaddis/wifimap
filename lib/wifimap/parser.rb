# frozen_string_literal: true

require 'wifimap/parser/airodump'

module Wifimap
  module Parser
    # Parse the content of a dump file and return a hash of APs, stations and probes.
    def self.parse(file_content)
      if dump_format(file_content) == :airodump
        Wifimap::Parser::Airodump.new(file_content)
      end
    end

    # Check the file content and identify the dump format or raise an error.
    def self.dump_format(file_content)
      airodump_header = 'BSSID, First time seen, Last time seen, channel, Speed, Privacy, Cipher, Authentication, Power'
      return :airodump if file_content.include?(airodump_header)

      raise Error, 'Unsupported dump format'
    end
  end
end
