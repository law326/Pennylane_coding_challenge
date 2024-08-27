class Recipe < ApplicationRecord
  def self.search(query)
    query_strs = query.split(' ').map{|q| "%#{q}%" }.join(',')
    where("ingredients LIKE ALL (ARRAY[?])", query_strs)
  end
end
