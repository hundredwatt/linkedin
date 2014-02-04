require 'helper'

describe LinkedIn do

  before(:each) do
    LinkedIn.token = nil
    LinkedIn.secret = nil
    LinkedIn.default_profile_fields = nil
  end

  it "should be able to set the consumer token and consumer secret" do
    LinkedIn.token  = 'consumer_token'
    LinkedIn.secret = 'consumer_secret'

    LinkedIn.token.should  == 'consumer_token'
    LinkedIn.secret.should == 'consumer_secret'
  end

  it "should be able to set the default profile fields" do
    LinkedIn.default_profile_fields = ['educations', 'positions']

    LinkedIn.default_profile_fields.should == ['educations', 'positions']
  end

  it "should be able to set the consumer token and consumer secret via a configure block" do
    LinkedIn.configure do |config|
      config.token  = 'consumer_token'
      config.secret = 'consumer_secret'
      config.default_profile_fields = ['educations', 'positions']
    end

    LinkedIn.token.should  == 'consumer_token'
    LinkedIn.secret.should == 'consumer_secret'
    LinkedIn.default_profile_fields.should == ['educations', 'positions']
  end

  describe "#middleware" do
    it "provides a default middleware stack" do
      LinkedIn.middleware = nil

      LinkedIn::Client.new.send(:middleware).should be_instance_of(Faraday::Builder)
    end

    it "allows the user to define their own middleware stack" do
      custom_middleware = Faraday::Builder.new do |faraday|
        faraday.adapter :net_http
      end

      LinkedIn.middleware = custom_middleware

      LinkedIn.middleware.should == custom_middleware
    end
  end
end
