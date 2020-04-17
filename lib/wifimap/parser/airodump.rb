# frozen_string_literal: true

require 'wifimap/mac'

module Wifimap
  module Parser
    # Parse the content of an airodump.csv file.
    class Airodump
      def initialize(dump)
        @dump = dump
      end

      # Get the list of access points from the dump.
      def access_points
        aps = @dump.split("\n").filter do |row|
          fields = row.split(',')
          channel = fields[3].to_i
          Mac.valid?(fields.first) && channel.between?(1, 16)
        end

        aps.map do |ap|
          fields = ap.split(',')
          AccessPoint.new(
            bssid: fields.first,
            privacy: fields[5].strip,
            essid: fields[13].strip
          )
        end
      end

      # Get the list of stations from the dump.
      def stations
        stations = @dump.split("\n").filter do |row|
          fields = row.split(',')
          power = fields[3].to_i
          Mac.valid?(fields.first) && power.negative?
        end

        stations.map do |st|
          fields = st.split(',')
          Station.new(mac: fields.first)
        end
      end
    end
  end
end
