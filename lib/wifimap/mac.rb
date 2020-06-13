# frozen_string_literal: true

require 'louis'

module Wifimap
  class Mac
    # Return true if the mac format is correct, false otherwise.
    #
    # @param [String] mac
    # @return [Boolean]
    def self.valid?(mac)
      mac =~ /([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})/ ? true : false
    end

    # Get the manufacturer for the given mac address.
    #
    # @param [String] mac
    # @return [String]
    def self.manufacturer(mac)
      Louis.lookup(mac)['long_vendor']
    end
  end
end
