class Recipe < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, type: 'text', analyzer: 'english'
      indexes :ingredients, type: 'text', analyzer: 'english'
    end
  end

  def self.search(query)
    self.__elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            operator: 'and',
            fields: ['ingredients'],
            fuzziness: 'AUTO'
          }
        },
        size: 10000
      }
    )&.records
  end
end
