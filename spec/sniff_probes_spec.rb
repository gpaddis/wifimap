# frozen_string_literal: true

require 'wifimap/access_point'
require 'wifimap/station'
require 'wifimap/parser/sniff_probes'

RSpec.describe Wifimap::Parser::SniffProbes do
  let(:sniff_probes_file) { File.read('spec/dumps/sniff-probes.txt') }
  let(:sniff_probes) { Wifimap::Parser::SniffProbes.new(sniff_probes_file) }

  describe '#access_points' do
    it 'returns an empty list of access points' do
      access_points = sniff_probes.access_points
      expect(access_points).to be_empty
      expect(access_points).to be_an_instance_of(Array)
    end
  end

  describe '#stations' do
    let(:stations) { sniff_probes.stations }

    it 'returns a list of stations' do
      expect(stations.count).to eq 4
      expect(stations).to be_an_instance_of(Array)
    end

    it 'maps the correct station fields' do
      expect(stations.first).to be_an_instance_of(Wifimap::Station)
      expect(stations.first.mac).to eq('da:a1:19:17:e0:11')
      expect(stations.first.manufacturer).to eq('Google, Inc.')
    end

    describe 'probes' do
      it 'lists the probed ESSIDs' do
        expect(stations.last.probes).to be_an_instance_of(Array)
        expect(stations.last.probes.count).to eq 2
        expect(stations.last.probes).to include('Starbucks Cafe')
      end
    end
  end
end
