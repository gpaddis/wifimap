# frozen_string_literal: true

module Wifimap
  module Parser
    # Check the file content and identify the dump format.
    def self.dump_format(file_content)
      airodump_header = 'BSSID, First time seen, Last time seen, channel, Speed, Privacy, Cipher, Authentication, Power'
      :airodump if file_content.include?(airodump_header)
    end
  end
end
