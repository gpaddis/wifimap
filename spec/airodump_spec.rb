# frozen_string_literal: true

require 'wifimap/access_point'
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

    it 'maps the fields correctly' do
      expect(access_points.first).to be_an_instance_of(Wifimap::AccessPoint)
      expect(access_points.first.bssid).to eq('04:F0:21:13:32:29')
      expect(access_points.first.privacy).to eq('OPN')
      expect(access_points.first.essid).to eq('Access Point 1')
    end
  end

  describe '#stations' do
    it 'returns a list of stations' do
      stations = airodump.stations
      expect(stations.count).to equal 5
      expect(stations).to be_an_instance_of(Array)
    end
  end

  describe '#probes' do
    it 'returns a list of probes' do
      probes = airodump.probes
      expect(probes.count).to equal 2
      expect(probes).to be_an_instance_of(Array)
    end
  end
end
