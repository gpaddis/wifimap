# frozen_string_literal: true

require 'wifimap/mac'

RSpec.describe Wifimap::Mac, '.valid?' do
  it 'returns true with valid MAC addresses' do
    expect(Wifimap::Mac.valid?('04:F0:21:13:32:29')).to be true
  end

  it 'returns false with invalid MAC addresses' do
    expect(Wifimap::Mac.valid?('04:F0:21:13:32:2')).to be false
    expect(Wifimap::Mac.valid?('04:F0:21:13:32:ZZ')).to be false
    expect(Wifimap::Mac.valid?('invalid-mac-address')).to be false
  end
end

RSpec.describe Wifimap::Mac, '.manufacturer' do
  it 'returns the manufacturer of a known mac vendor' do
    expect(Wifimap::Mac.manufacturer('7C:7D:3D:40:D1:DF')).to eq 'Huawei Technologies Co.,Ltd'
  end

  it 'returns the string "Unknown" for an unknown mac vendor' do
    expect(Wifimap::Mac.manufacturer('AA:7D:3D:40:D1:DF')).to eq 'Unknown'
  end
end
