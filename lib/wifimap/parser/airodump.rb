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
        aps = rows.each.map { |row| row.split(',') }
        aps.filter! do |fields|
          channel = fields[3].to_i
          Mac.valid?(fields.first) && channel.between?(1, 16)
        end

        aps.map do |fields|
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
        stations = rows.each.map { |row| row.split(',') }
        stations.filter! do |fields|
          power = fields[3].to_i
          Mac.valid?(fields.first) && power.negative?
        end

        stations.map do |fields|
          station = Station.new(mac: fields.first)
          station.associations << fields[5].strip unless fields[5].include?('(not associated)')
          station.probes << fields[6].strip unless fields[6].strip.empty?
          station
        end
      end
    end
  end
end
