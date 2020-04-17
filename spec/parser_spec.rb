# frozen_string_literal: true

require 'wifimap/parser'

RSpec.describe Wifimap::Parser, '.parse' do
  let(:airodump_file) { File.read('spec/dumps/airodump.csv') }

  it 'returns an airodump parser instance' do
    result = Wifimap::Parser.parse(airodump_file)
    expect(result).to be_an_instance_of(Wifimap::Parser::Airodump)
  end

  it 'raises an error if the dump format is not supported' do
    expect { Wifimap::Parser.parse('invalid file content') }.to raise_error('Unsupported dump format')
  end
end

RSpec.describe Wifimap::Parser, '.dump_format' do
  let(:airodump_file) { File.read('spec/dumps/airodump.csv') }

  it 'identifies a valid airodump format' do
    expect(Wifimap::Parser.dump_format(airodump_file)).to be(:airodump)
  end

  it 'returns nil with an invalid dump format' do
    expect(Wifimap::Parser.dump_format('invalid file content')).to be_nil
  end
end
