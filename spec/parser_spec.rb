RSpec.describe Wifimap::Parser, '.parse' do
  let(:airodump_file) { File.read('spec/files/airodump.csv') }

  it 'returns an array with a valid airodump file' do
    expect(Wifimap::Parser.parse(airodump_file)).to be_an_instance_of(Array)
  end
end

RSpec.describe Wifimap::Parser, '.dump_format' do
  let(:airodump_file) { File.read('spec/files/airodump.csv') }

  it 'identifies a valid airodump format' do
    expect(Wifimap::Parser.dump_format(airodump_file)).to eq('airodump')
  end

  it 'raises an error if the dump format is unknown' do
    expect { Wifimap::Parser.dump_format('invalid file content') }.to raise_error
  end
end
