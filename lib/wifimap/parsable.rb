# frozen_string_literal: true

module Wifimap
  # The parsable module contains some helper methods and must-implement
  # directives for parser classes.
  module Parsable
    # Get the dump property for further processing.
    #
    # @return [String]
    def dump
      raise 'Error: the dump is empty' if @dump.nil?

      @dump
    end

    # Split the dump by newline to get an array of all rows.
    #
    # @return [Array]
    def dump_rows
      dump.split("\n")
    end

    # To be implemented in the class.
    def stations
      raise ::NotImplementedError
    end

    # To be implemented in the class.
    def access_points
      raise ::NotImplementedError
    end
  end
end
