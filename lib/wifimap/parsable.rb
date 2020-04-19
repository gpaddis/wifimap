# frozen_string_literal: true

module Wifimap
  module Parsable
    # Get the dump property for further processing.
    def dump
      raise 'Error: the dump is empty' if @dump.nil?

      @dump
    end

    # Get an enumerator with each row in the dump.
    def each_row
      dump.split("\n").each
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
