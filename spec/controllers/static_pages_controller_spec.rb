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

  describe "GET 'company_profile'" do
    it "returns http success" do
      get 'company_profile'
      response.should be_success
    end
  end

  describe "GET 'company_policy'" do
    it "returns http success" do
      get 'company_policy'
      response.should be_success
    end
  end

  describe "GET 'staff_profile'" do
    it "returns http success" do
      get 'staff_profile'
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

end
