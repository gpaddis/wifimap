# frozen_string_literal: true

module Wifimap
  class Mac
    # Return true if the mac format is correct, false otherwise.
    def self.valid?(mac)
      mac =~ /([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})/ ? true : false
    end
  end
end
