# frozen_string_literal: true

module Wifimap
  # Instantiate the correct parser class according to the dump format.
  module ParserFactory
    class << self
      # Instantiate the parser factory or raise an error
      # if the dump is not supported.
      def create(file_content)
        case dump_format(file_content)
        when :airodump
          Wifimap::Parser::Airodump.new(file_content)
        when :sniff_probes
          Wifimap::Parser::SniffProbes.new(file_content)
        else
          raise Error, 'Unsupported dump format'
        end
      end

      # Check the file content and identify the correct dump format.
      #
      # @param [String] file_content
      # @return [Symbol|Nil]
      def dump_format(file_content)
        return :airodump if airodump_format?(file_content)
        return :sniff_probes if sniff_probes_format?(file_content)
      end

      # @param [String] file_content
      # @return [Boolean]
      private def airodump_format?(file_content)
        airodump_header = 'BSSID, First time seen, Last time seen, channel, Speed, Privacy, Cipher, Authentication, Power'
        file_content.include?(airodump_header)
      end

      # @param [String] file_content
      # @return [Boolean]
      private def sniff_probes_format?(file_content)
        file_content.split("\n").all? do |row|
          fields = row.split
          fields[1].include?('dBm') && Wifimap::Mac.valid?(fields[2])
        end
      end
    end
  end
end
