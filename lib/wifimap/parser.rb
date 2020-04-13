# frozen_string_literal: true

module Wifimap
  class Parser
    # Parse the content of a dump file and return an array of wifimap objects.
    def self.parse(_file_content)
      []
    end

    def self.dump_format(file_content)
      # TODO: perform thorough checks on file content.
      raise Error unless file_content.include?('BSSID')

      'airodump'
    end
  end
end
