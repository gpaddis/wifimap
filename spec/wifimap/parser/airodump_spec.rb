# frozen_string_literal: true

RSpec.describe Wifimap::Parser::Airodump do
  let(:airodump_file) { File.read('spec/dumps/airodump.csv') }
  let(:airodump) { described_class.new(airodump_file) }

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

    describe 'associations' do
      it 'lists the associated access point BSSIDs' do
        expect(stations.last.associations).to be_an_instance_of(Array)
        expect(stations.last.associations).to include('5C:2E:59:3B:15:73')
      end

      it 'returns an empty array if the station is not associated with an access point' do
        expect(stations.first.associations).to be_empty
      end
    end

    describe 'probes' do
      it 'lists the probed ESSIDs' do
        expect(stations.last.probes).to be_an_instance_of(Array)
        expect(stations.last.probes).to include('Access Point 3')
      end

      it 'returns an empty array if the station has no probes' do
        expect(stations.first.probes).to be_empty
      end
    end
  end
end
