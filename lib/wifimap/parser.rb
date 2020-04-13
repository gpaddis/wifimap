# frozen_string_literal: true

module Wifimap
  class Parser
    # Parse the content of a dump file and return a hash of APs, stations and probes.
    def self.parse(_file_content)
      {
        access_points: [],
        stations: [],
        probes: []
      }
    end

    # Check the file content and identify the dump format or raise an error.
    def self.dump_format(file_content)
      airodump_header = 'BSSID, First time seen, Last time seen, channel, Speed, Privacy, Cipher, Authentication, Power'
      return :airodump if file_content.include?(airodump_header)

      raise Error, 'Unsupported dump format'
    end
  end
end
