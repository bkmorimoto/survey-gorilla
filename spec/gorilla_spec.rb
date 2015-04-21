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

describe "Survey controller" do

  it "should go to the new survey page" do
    get '/surveys/new'
    expect(last_response.body).to include('<input class="form-control new_input" type="text" name="survey[title]">')
  end

  it "should redirect to new signin if no current_user" do
    get '/'
    expect(last_response.redirect?).to be_true
    follow_redirect!
    expect(last_request.path).to eq('/signin')

  end

end


# it "displays home page if there is no user" do
#   get '/welcome', :user => nil

#   expect(last_response.redirect?).to be_true
#   follow_redirect!
#   expect(last_request.path).to eq('/')
# end
