# frozen_string_literal: true

module Wifimap
  class Station
    attr_reader :mac
    attr_accessor :associations, :probes

    # @param [String] mac
    def initialize(mac:)
      @mac = mac
      @associations = []
      @probes = []
    end

    # Get the device manufacturer based on the mac.
    #
    # @return [String]
    def manufacturer
      Mac.manufacturer(mac)
    end
  end
end
