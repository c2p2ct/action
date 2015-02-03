require 'elasticsearch/model'

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks


    settings analysis: {
              analyzer: {
                standard: {
                  type: "standard",
                  tokenizer: "standard",
                  filter: [ "standard", "lowercase", "stop", "kstem", "ngram" ]
                }
               }
             }
  end
end
