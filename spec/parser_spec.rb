require 'wifimap/parser'

RSpec.describe Wifimap::Parser, '.dump_format' do
  let(:airodump_file) { File.read('spec/dumps/airodump.csv') }

  it 'identifies a valid airodump format' do
    expect(Wifimap::Parser.dump_format(airodump_file)).to be(:airodump)
  end

  it 'returns nil with an invalid dump format' do
    expect(Wifimap::Parser.dump_format('invalid file content')).to be_nil
  end
end