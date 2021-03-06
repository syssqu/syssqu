require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'service'" do
    it "returns http success" do
      get 'service'
      response.should be_success
    end
  end

  describe "GET 'profile_company'" do
    it "returns http success" do
      get 'profile_company'
      response.should be_success
    end
  end

  describe "GET 'policy'" do
    it "returns http success" do
      get 'policy'
      response.should be_success
    end
  end

  describe "GET 'profile_staff'" do
    it "returns http success" do
      get 'profile_staff'
      response.should be_success
    end
  end

  describe "GET 'access'" do
    it "returns http success" do
      get 'access'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'news'" do
    it "returns http success" do
      get 'news'
      response.should be_success
    end
  end

  describe "Ajax GET 'change_day_select'" do
    it "returns http success" do
      xhr :get, :change_day_select
      response.should be_success
    end
  end

  describe "GET 'entry'" do
    it "returns http success" do
      get 'entry'
      response.should be_success
    end
  end

  describe "GET 'career_entry'" do
    it "returns http success" do
      get 'career_entry'
      response.should be_success
    end
  end

end
