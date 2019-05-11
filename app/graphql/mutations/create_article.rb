# frozen_string_literal: true

class Mutations::CreateArticle < Mutations::BaseMutation
  argument :title, String, required: true
  argument :content, String, required: true

  field :article, Types::ArticleType, null: true

  def resolve(arguments)
    article = Article.new(arguments)
    article.user = context[:current_user]
    # TODO: raise Pundit::NotAuthorizedError unless ArticlePolicy.new(context[:current_user], Article).create?

    if article.save!
      {
        article: article
      }
    end
  end
end
