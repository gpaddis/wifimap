# frozen_string_literal: true

module Wifimap
  module Parser
    # Parse the content of a sniff-probes file.
    class SniffProbes
      include Wifimap::Parsable

      attr_reader :access_points

      # @param [String] dump
      def initialize(dump)
        @dump = dump
        @access_points = []
      end

      # Get the list of stations from the dump.
      #
      # @return [Array] of Wifimap::Station
      def stations
        unique_macs.map do |mac|
          station = Station.new(mac: mac)
          rows.each do |row|
            fields = row.split('"')
            unless station.probes.include?(fields[1])
              station.probes << fields[1] if fields[0].include?(mac)
            end
          end
          station
        end
      end

      # Return all unique mac addresses.
      #
      # @return [Array]
      private def unique_macs
        rows.map { |row| row.split[2] }.uniq
      end
    end
  end
end
