require "spec_helper"

describe SendMailer do
  describe "send_entry" do
    let(:mail) { SendMailer.send_entry }

    it "renders the headers" do
      mail.subject.should eq("Send entry")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "send_inquiry" do
    let(:mail) { SendMailer.send_inquiry }

    it "renders the headers" do
      mail.subject.should eq("Send inquiry")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end
end


# Argument error
  # wrong number of argument
