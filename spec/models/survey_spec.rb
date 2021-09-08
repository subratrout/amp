require 'rails_helper'

RSpec.describe Survey, type: :model do
  context 'create survey' do
    it "is valid with valid attributes" do
      survey = Survey.new(name: "Test")
      expect(survey).to be_valid
    end
    it 'should have a name' do
      survey = Survey.new(name: nil)
      survey.validate
      expect(survey.errors[:name]).to include("can't be blank")
    end
  end
end
