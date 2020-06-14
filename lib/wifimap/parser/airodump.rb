# frozen_string_literal: true

module Wifimap
  module Parser
    # Parse the content of an airodump.csv file.
    class Airodump
      include Wifimap::Parsable

      def initialize(dump)
        @dump = dump
      end

      # Get the list of access points from the dump.
      #
      # @return [Array] of Wifimap::AccessPoint
      def access_points
        dump_row_fields
          .filter { |row| valid_access_point?(row) }
          .map do |fields|
            AccessPoint.new(
              bssid: fields.first,
              privacy: fields[5].strip,
              essid: fields[13].strip
            )
          end
      end

      # Get the list of stations from the dump.
      #
      # @return [Array] of Wifimap::Station
      def stations
        dump_row_fields
          .filter { |row| valid_station?(row) }
          .map do |fields|
            station = Station.new(mac: fields.first)
            station.associations << fields[5].strip unless fields[5].include?('(not associated)')
            station.probes << fields[6].strip unless fields[6].strip.empty?
            station
          end
      end

      # Get an array of all dump rows split by comma.
      #
      # @return [Array]
      private def dump_row_fields
        dump_rows.each.map { |row| row.split(',') }
      end

      # Check if the fields correspond to a valid access point.
      #
      # @param [Array] fields
      # @return [Boolean]
      private def valid_access_point?(fields)
        channel = fields[3].to_i
        Mac.valid?(fields.first) && channel.between?(1, 16)
      end

      # Check if the fields correspond to a valid access station.
      #
      # @param [Array] fields
      # @return [Boolean]
      private def valid_station?(fields)
        power = fields[3].to_i
        Mac.valid?(fields.first) && power.negative?
      end
    end
  end
end
