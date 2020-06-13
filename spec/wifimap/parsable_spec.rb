# frozen_string_literal: true

class CorrectParserImplementation
  include Wifimap::Parsable

  def initialize(dump)
    @dump = dump
  end

  def stations
    rows.each.map { |row| "Current station: #{row}" }
  end

  def access_points
    rows.each.map { |row| "Current access_point: #{row}" }
  end
end

class WrongParserImplementation
  include Wifimap::Parsable
end

RSpec.describe Wifimap::Parsable do
  let(:correct_parser) { CorrectParserImplementation.new("a\nb\nc\nd\ne") }
  let(:wrong_parser) { WrongParserImplementation.new }

  describe '#dump' do
    it 'raises an error if the dump is not initialized' do
      expect { wrong_parser.dump }.to raise_error('Error: the dump is empty')
    end
  end

  describe '#rows' do
    it 'returns a array with all rows' do
      expect(correct_parser.rows.count).to eq 5
    end
  end

  describe '#stations' do
    it 'returns an array on a correct implementation' do
      expect(correct_parser.stations).to be_an_instance_of Array
    end

    it 'raises an error if the method is not implemented' do
      expect { wrong_parser.stations }.to raise_error('NotImplementedError')
    end
  end

  describe '#access_points' do
    it 'returns an array on a correct implementation' do
      expect(correct_parser.access_points).to be_an_instance_of Array
    end

    it 'raises an error if the method is not implemented' do
      expect { wrong_parser.access_points }.to raise_error('NotImplementedError')
    end
  end
end
