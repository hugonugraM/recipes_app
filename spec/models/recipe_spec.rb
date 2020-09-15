require 'rails_helper'

RSpec.describe Recipe, :type => :model do

  it "is valid creating a new object" do
    expect(Recipe.new("abcd", "example", "path/to/picture", ["a","b","c"], "a description", "Hugo")).to be_valid
  end

  it "is not valid creating a new object without all params" do
    expect{Recipe.new()}.to raise_error(ArgumentError)
  end

  it "list all recipes" do
    expect(Recipe.all.length).to be > 0
  end

  it "find a specific recipe by id" do
    expect(Recipe.find("4dT8tcb6ukGSIg2YyuGEOm").id).eql? "4dT8tcb6ukGSIg2YyuGEOm"
  end

end
