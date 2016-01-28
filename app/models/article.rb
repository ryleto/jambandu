class Article < ActiveRecord::Base
    has_many :comments
    default_scope -> { order(pubdate: :desc) }
    acts_as_commentable
    acts_as_taggable
end
