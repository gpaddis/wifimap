# frozen_string_literal: true

require 'wifimap'

RSpec.describe Wifimap do
  it 'has a version number' do
    expect(Wifimap::VERSION).not_to be nil
  end
end

RSpec.describe Wifimap, '.parse' do
  let(:airodump_file) { File.read('spec/dumps/airodump.csv') }

  it 'returns an airodump parser instance' do
    result = Wifimap.parse(airodump_file)
    expect(result).to be_an_instance_of(Wifimap::Parser::Airodump)
  end

  it 'raises an error if the dump format is not supported' do
    expect { Wifimap.parse('invalid file content') }.to raise_error('Unsupported dump format')
  end
end

RSpec.describe Wifimap, '.parse_file' do
  it 'reads the contents of a file and parses it' do
    airodump_file = 'spec/dumps/airodump.csv'
    parsed_file = Wifimap.parse_file(airodump_file)
    parsed_content = Wifimap.parse(File.read(airodump_file))
    expect(parsed_file.stations.first.mac).to eql(parsed_content.stations.first.mac) # Sample attribute.
  end
end
