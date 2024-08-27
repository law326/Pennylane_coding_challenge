require 'json'

ATTR_MAPPINGS = {
  title: 'title',
  cook_time: 'cook_time',
  prep_time: 'prep_time',
  category: 'category',
  ingredients: 'ingredients',
  image: 'image'
}

class RecipesImporter
  def self.run(file_path)
    file = File.open(file_path)
    recipes_json = JSON.load(file)
    recipes = recipes_json.map do |recipe|
      Recipe.new(
        title: recipe[ATTR_MAPPINGS[:title]],
        cook_time: recipe[ATTR_MAPPINGS[:cook_time]],
        prep_time: recipe[ATTR_MAPPINGS[:prep_time]],
        category: recipe[ATTR_MAPPINGS[:category]],
        ingredients: recipe[ATTR_MAPPINGS[:ingredients]],
        image: recipe[ATTR_MAPPINGS[:image]]
      )
    end
    Recipe.import(recipes)
  end
end
