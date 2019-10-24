include Resolvers::Queries::MediumQueries

module Types
  module Query
    MediumQuery = GraphQL::ObjectType.define do
      name 'MediumQuery'

      field :getMedium, function: GetMedium.new
      field :getMedia, function: GetMedia.new
      connection :getUserMedia, function: GetUserMedia.new
      connection :getAllMedia, function: GetAllMedia.new
    end
  end
end
