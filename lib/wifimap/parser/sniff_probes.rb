# frozen_string_literal: true

require 'wifimap/mac'
require 'wifimap/station'

module Wifimap
  module Parser
    # Parse the content of a sniff-probes file.
    class SniffProbes
      attr_reader :access_points

      def initialize(dump)
        @dump = dump
        @access_points = []
      end

      # Get the list of stations from the dump.
      def stations
        rows = @dump.split("\n")
        unique_macs = rows.map { |row| row.split[2] }.uniq
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
    end
  end
end
