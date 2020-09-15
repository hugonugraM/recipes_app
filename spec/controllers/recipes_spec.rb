require "rails_helper"

RSpec.describe RecipesController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "200 status on GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "renders the SHOW template" do
      get :show, params: { id: "4dT8tcb6ukGSIg2YyuGEOm" }
      expect(response).to render_template("show")
    end
  end

  describe "200 status on SHOW index" do
    it "has a 200 status code" do
      get :show, params: { id: "4dT8tcb6ukGSIg2YyuGEOm" }
      expect(response.status).to eq(200)
    end
  end
end