require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Inquiry page" do
    before { visit inquiry_page_path }

    it { should have_content('お問い合わせ') }
  end

  describe "Inquiry confirm" do

    it "should have the content '入力内容確認'" do
      visit inquiry_confirm_path
      expect(page).to have_content('入力内容確認')
    end
  end

  describe "Inquiry send" do
    before { visit inquiry_page_path }

    it { should have_content('お問い合わせ') }
  end

  describe "entry send" do
  	before { visit entry_path }

  	it { should have_content('新卒採用　エントリ') }
  end

end
