# frozen_string_literal: true

module Wifimap
  class AccessPoint
    attr_reader :bssid, :privacy, :essid

    def initialize(bssid:, privacy:, essid:)
      @bssid = bssid
      @privacy = privacy
      @essid = essid
    end

    # Get the device manufacturer based on the bssid.
    #
    # @return [String]
    def manufacturer
      Mac.manufacturer(bssid)
    end
  end
end
