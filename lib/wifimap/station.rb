# frozen_string_literal: true

module Wifimap
  class Station
    attr_reader :mac
    attr_accessor :associations, :probes

    def initialize(mac:)
      @mac = mac
      @associations = []
      @probes = []
    end

    # Get the device manufacturer based on the mac.
    def manufacturer
      Mac.manufacturer(mac)
    end
  end
end
