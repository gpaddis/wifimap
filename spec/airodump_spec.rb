# frozen_string_literal: true

require 'wifimap/parser/airodump'

RSpec.describe Wifimap::Parser::Airodump do
  let(:airodump_file) { File.read('spec/dumps/airodump.csv') }
  let(:airodump) { Wifimap::Parser::Airodump.new(airodump_file) }

  it 'returns a list of access points' do
    access_points = airodump.access_points
    expect(access_points.count).to equal 3
    expect(access_points).to be_an_instance_of(Array)
  end

  it 'returns a list of stations' do
    stations = airodump.stations
    expect(stations.count).to equal 5
    expect(stations).to be_an_instance_of(Array)
  end

  it 'returns a list of probes' do
    probes = airodump.probes
    expect(probes.count).to equal 2
    expect(probes).to be_an_instance_of(Array)
  end
end
