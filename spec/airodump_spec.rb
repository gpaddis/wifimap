# frozen_string_literal: true

require 'wifimap/access_point'
require 'wifimap/station'
require 'wifimap/parser/airodump'

RSpec.describe Wifimap::Parser::Airodump do
  let(:airodump_file) { File.read('spec/dumps/airodump.csv') }
  let(:airodump) { Wifimap::Parser::Airodump.new(airodump_file) }

  describe '#access_points' do
    let(:access_points) { airodump.access_points }

    it 'returns a list of access points' do
      expect(access_points.count).to equal 3
      expect(access_points).to be_an_instance_of(Array)
    end

    it 'maps the correct access point fields' do
      expect(access_points.first).to be_an_instance_of(Wifimap::AccessPoint)
      expect(access_points.first.bssid).to eq('04:F0:21:13:32:29')
      expect(access_points.first.privacy).to eq('OPN')
      expect(access_points.first.essid).to eq('Access Point 1')
      expect(access_points.first.manufacturer).to eq('Compex Systems Pte Ltd')
    end
  end

  describe '#stations' do
    let(:stations) { airodump.stations }

    it 'returns a list of stations' do
      expect(stations.count).to eq 5
      expect(stations).to be_an_instance_of(Array)
    end

    it 'maps the correct station fields' do
      expect(stations.count).to eq 5
      expect(stations.first).to be_an_instance_of(Wifimap::Station)
      expect(stations.last.mac).to eq('34:12:98:B3:D1:1B')
      expect(stations.last.manufacturer).to eq('Apple, Inc.')
    end
  end
end
