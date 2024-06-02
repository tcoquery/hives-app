require 'rails_helper'

RSpec.describe Hive, type: :model do
  describe 'validations' do
    it "is not valid with a name of less than 6 characters" do
      hive = Hive.new(name: "test", weight: 0)
      expect(hive).to_not be_valid
    end

    it "is valid with a name of 6 or more characters" do
      hive = Hive.new(name: "test_hive", weight: 10)
      expect(hive).to be_valid
    end

    it "is not valid without a weight" do
      hive = Hive.new(name: "test_hive", weight: nil)
      expect(hive).to_not be_valid
    end

    it "is not valid with a negative weight" do
      hive = Hive.new(name: "test_hive", weight: -1)
      expect(hive).to_not be_valid
    end
  end
end
