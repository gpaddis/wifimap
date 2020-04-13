# frozen_string_literal: true

require 'wifimap/mac'

RSpec.describe Wifimap::Mac, '.valid?' do
  it 'returns true with valid MAC addresses' do
    expect(Wifimap::Mac.valid?('04:F0:21:13:32:29')).to be(true)
  end

  it 'returns false with invalid MAC addresses' do
    expect(Wifimap::Mac.valid?('invalid-mac-address')).to be(false)
    expect(Wifimap::Mac.valid?('04:F0:21:13:32:ZZ')).to be(false)
    expect(Wifimap::Mac.valid?('04:F0:21:13:32:2')).to be(false)
  end
end
