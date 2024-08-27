require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '.search' do
    before do
      Recipe.create(title: 'Recipe 1', ingredients: "[\'apple\', \'banana\']")
      Recipe.create(title: 'Recipe 2', ingredients: "[\'flour\', \'milk\']")
      Recipe.create(title: 'Recipe 3', ingredients: "[\'flour\', \'milk\', \'banana\']")
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

    context 'when no results are found' do
      let(:search_param) { 'chocolate' }

      it { is_expected.to be_empty }
    end
  end
end
