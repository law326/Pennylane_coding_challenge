require 'rails_helper'

RSpec.describe Recipe, elasticsearch: true, type: :model do
  describe '.search' do
    before do
      Recipe.__elasticsearch__.index_name = 'recipes_test'
      Recipe.create(title: 'Recipe 1', ingredients: ['apple', 'banana'])
      Recipe.create(title: 'Recipe 2', ingredients: ['flour', 'milk'])
      Recipe.create(title: 'Recipe 3', ingredients: ['flour', 'milk', 'banana'])
      Recipe.__elasticsearch__.refresh_index!
    end

    after do
      Recipe.__elasticsearch__.delete_index!
      Recipe.__elasticsearch__.index_name = 'recipes'
    end

    subject { Recipe.search(search_param) }

    context 'with single search term' do
      let(:search_param) { 'apple' }

      it { is_expected.to contain_exactly(have_attributes(title: 'Recipe 1')) }
    end

    context 'with multiple search terms' do
      let(:search_param) { 'flour banana' }

      it { is_expected.to contain_exactly(have_attributes(title: 'Recipe 3')) }
    end
  end
end
