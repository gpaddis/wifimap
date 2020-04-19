# frozen_string_literal: true

module Wifimap
  module Parsable
    # Get the dump property for further processing.
    def dump
      raise 'Error: the dump is empty' if @dump.nil?

      @dump
    end

    # Get an array of all rows in the dump.
    def rows
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
