RSpec.describe Wifimap::Parser, '.parse' do
  let(:airodump_file) { File.read('spec/files/airodump.csv') }

  it 'returns an array with a valid airodump file' do
    expect(Wifimap::Parser.parse(airodump_file)).to be_an_instance_of(Array)
  end
end
