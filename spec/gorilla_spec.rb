require 'spec_helper'
require_relative 'factories/survey.rb'
require_relative 'factories/user.rb'

describe Survey do
  let(:survey) { FactoryGirl.create(:survey) }

  it "should return a survey title" do
    expect(survey.title).to eq("Charlie")
  end

  it "should create a link code" do
    code = survey.create_link_code
    expect(survey.link_code).to eq(code)
  end
end

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it { should have_secure_password }

  it { should have_many(:surveys_created) }
end
