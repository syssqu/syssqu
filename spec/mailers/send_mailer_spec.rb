require 'spec_helper'

describe SendMailer do
  describe "send_entry" do

    let(:mail) { SendMailer.send_entry( { family_name: "aaa", first_name: "bbb", kana_family_name: "ccc",
                                          kana_first_name: "ddd", gender: "eee", birth_year: "fff",
                                          birth_month: "ggg", birth_day: "hhh", email: "aaa@bb.c",
                                          postal_code: "111-1111",prefecture: "大阪府", city: "大阪市",
                                          house_number: "1-2-3",building: "大阪ビル",phone: "123-4567-8912",
                                          gakureki: "iii",motive: "jjj", pr: "kkk" } ) }

    it "renders the headers" do
      mail.subject.should eq ("Send entry")
      mail.to.should eq ( ["syssqu@gmail.com"] )
      mail.from.should eq ( ["njsekay@gmail.com"] )
    end

    it "renders the body" do
      mail.body.encoded.should match("aaa")
    end
  end

  describe "send_inquiry" do
    let(:mail) { SendMailer.send_inquiry( { family_name: "aaa", first_name: "bbb", kana_family_name: "ccc",
                                            kana_first_name: "ddd", mail: "eee", mail_confirm: "fff",
                                            inquiry: "ggg" } ) }

    it "renders the headers" do
      mail.subject.should eq ("Send inquiry")
      mail.to.should eq ( ["syssqu@gmail.com"] )
      mail.from.should eq ( ["njsekay@gmail.com"] )
    end

    it "renders the body" do
      mail.body.encoded.should match("aaa")
    end
  end
end
