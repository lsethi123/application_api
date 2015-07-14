require 'spec_helper'

describe Appliance, :type => :model do
  describe "#new" do
    it "validates unique appliance names" do
      Appliance.create name: 'app1', customer: 'WhiteHat'
      appliance = Appliance.new name: 'app1', customer: 'WhiteHat'
      expect(appliance.save).to be(false)
    end
  end
  describe "#update_appliance_targets" do
    subject(:appliance) { Appliance.first }
    it "update each appliance target" do
      expect(appliance.targets).each do |target|
        expect(target.check_and_update_status).to be(true)
      end
    end
  end

end
