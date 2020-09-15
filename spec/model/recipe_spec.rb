require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  it "is valid creating a new object" do
    expect(Recipe.new()).to be_valid
  end

  it "list all recipes" do 
    expect(Recipe.all.length).to be > 0
  end

  it "find a specific recipe by id"

end
