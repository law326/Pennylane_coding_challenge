require './lib/recipes_importer.rb'

namespace :import_recipes do
  desc 'Import recipes from a JSON file'
  task :run, [:filename] => [:environment] do |task, args|
    puts 'Importing recipes...'
    file_path = "/app/data/#{args[:filename]}"
    RecipesImporter.run(file_path)
    puts 'Done!'
  end
end
