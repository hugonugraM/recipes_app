class Recipe
  attr_accessor :title, :image, :list_of_tags, :description, :chef_name

  def initialize(title, image, list_of_tags, description, chef_name = "")
    @title = title
    @image = image
    @list_of_tags = list_of_tags
    @description = description
    @chef_name = chef_name
  end

  def self.contentful
    @client ||= Contentful::Client.new(
      access_token: '7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c',
      space: 'kk2bw5ojx476',
      dynamic_entries: :auto,
      raise_errors: true
    )
  end

  def self.all
    all = []
    self.contentful.entries(content_type: 'recipe', include: 2).each do |recipe|
      chef_name = recipe.fields['chef'].nil? ? "-" : recipe.chef.name
      tags = recipe.fields['tags'].nil? ? [] : recipe.tags
      all << Recipe.new(recipe.title, recipe.photo.url, tags.map{|tag| tag.name}.uniq, recipe.description, chef_name)
    end
    all
  end

  def valid?
    !@title.nil? && !@image.nil? && !@list_of_tags.nil? && !@description.nil? && !@chef_name.nil?
  end

end