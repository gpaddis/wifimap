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
        @dump.split("\n").filter do |row|
          fields = row.split(',')
          channel = fields[3].to_i
          Mac.valid?(fields.first) && channel.between?(1, 16)
        end
      end

      # Get the list of stations from the dump.
      def stations
        @dump.split("\n").filter do |row|
          fields = row.split(',')
          power = fields[3].to_i
          Mac.valid?(fields.first) && power.negative?
        end
      end

      # Get the list of probes from the dump.
      def probes
        stations.filter do |row|
          fields = row.split(',')
          !fields.last.strip.empty?
        end
      end
    end
  end
end
