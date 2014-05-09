require 'spec_helper'

describe "Static　pages" do

  describe "Inquiry page" do
  	it "should have the content 'お問い合わせ'" do
  		visit inquiry_page_path
  		expect(page).to have_content('お問い合わせ')
  	end
  end

  describe "Inquiry send" do
  	it "should have the content '送信完了'" do
  		visit inquiry_page_path
  		expect(page).to have_content('送信完了')
  	end
  end
end
