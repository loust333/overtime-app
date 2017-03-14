# app/models/post.rb
class Post < ApplicationRecord
  validates_presence_of :date, :rationale
end
