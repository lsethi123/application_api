require 'spec_helper'

describe Target, :type => :model do
  let(:appliance) {Appliance.create! name: 'app1', customer: 'WhiteHat'}

  describe "#address" do
    it "validates IP addresses" do
      target = Target.new hostname: 'foo', address: '8.8.8.8', appliance: appliance
      expect(target.valid?).to be(true)
    end

    it "fails bad IP addresses" do
      target = Target.new hostname: 'foo', address: '888.888.888.888', appliance: appliance
      expect(target.valid?).to be(false)
    end
  end

  describe "#check_and_update_status" do
    it 'ping target address and update status' do
      expect(subject).to receive(:ping).and_return true
      subject.check_and_update_status
      expect(subject.status).equal? 'Up'
    end
  end

  describe '#ping' do
    it 'returns true for reachable address' do
      expect(subject.ping("127.0.0.1")).to be true
    end

    it 'returns false for unreachable address' do
      expect(subject.ping("4.68.25.165")).to be false
    end
  end
end
