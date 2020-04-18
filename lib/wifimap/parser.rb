# frozen_string_literal: true

require 'wifimap/mac'

module Wifimap
  module Parser
    # Check the file content and identify the correct dump format.
    def self.dump_format(file_content)
      return :airodump if airodump_format?(file_content)
      return :sniff_probes if sniff_probes_format?(file_content)
    end

    private
    def self.airodump_format?(file_content)
      airodump_header = 'BSSID, First time seen, Last time seen, channel, Speed, Privacy, Cipher, Authentication, Power'
      file_content.include?(airodump_header)
    end

    def self.sniff_probes_format?(file_content)
      file_content.split('\n').all? do |row|
        fields = row.split
        fields[1].include?('dBm') && Wifimap::Mac.valid?(fields[2])
      end
    end
  end
end
