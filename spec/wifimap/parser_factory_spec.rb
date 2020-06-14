# frozen_string_literal: true

RSpec.describe Wifimap::ParserFactory, '.dump_format' do
  it 'identifies a valid airodump format' do
    airodump_file = File.read('spec/dumps/airodump.csv')
    expect(Wifimap::ParserFactory.dump_format(airodump_file)).to be(:airodump)
  end

  it 'identifies a valid sniff-probes format' do
    airodump_file = File.read('spec/dumps/sniff-probes.txt')
    expect(Wifimap::ParserFactory.dump_format(airodump_file)).to be(:sniff_probes)
  end

  it 'returns nil with an invalid dump format' do
    expect(Wifimap::ParserFactory.dump_format('invalid file content')).to be_nil
  end
end
