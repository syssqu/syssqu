require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Inquiry page" do
    before { visit inquiry_page_path }

    it { should have_content('お問い合わせ') }
  end

  describe "Inquiry send" do
    before { visit inquiry_page_path }

    it { should have_content('お問い合わせ') }
  end

end
