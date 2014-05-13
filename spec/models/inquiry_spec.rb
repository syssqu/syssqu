require 'spec_helper'

describe Inquiry do

  before do
    @inquiry = Inquiry.new(family_name: "f", first_name: "fi", kana_family_name: "kf",
                           kana_first_name: "kfi", mail: "inquiry@example.com",
                           mail_confirmation: "inquiry_c@example.com", inquiry: "inq")
  end

  describe "when name is too long" do

    before { @inquiry.family_name       = "a" * 21,
             @inquiry.first_name        = "a" * 21,
             @inquiry.kana_family_name  = "a" * 21,
             @inquiry.kana_first_name   = "a" * 21 }

    it { should_not be_valid }
  end

  describe "when mail is too long" do

    before { @inquiry.mail              = "a" * 91,
             @inquiry.mail_confirmation = "a" * 91 }

    it { should_not be_valid }
  end

  describe "when inquiry is too long" do

    before { @inquiry.inquiry = "a" * 601 }

    it { should_not be_valid }
  end

  describe "when mail format is invalid" do

    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @inquiry.mail              = invalid_address
        @inquiry.mail_confirmation = invalid_address
        expect(@inquiry).not_to be_valid
      end
    end
  end

  describe "when mail format is valid" do

    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @inquiry.mail              = valid_address
        @inquiry.mail_confirmation = valid_address
        expect(@inquiry).to be_valid
      end
    end
  end
end
