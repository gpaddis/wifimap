# frozen_string_literal: true

module Wifimap
  class Station
    attr_reader :mac

    def initialize(mac:)
      @mac = mac
    end

    def associations
      []
    end

    def probes
      []
    end

    # Get the device manufacturer based on the mac.
    def manufacturer
      Mac.manufacturer(mac)
    end
  end
end
