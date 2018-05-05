# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :title, length: {minimum: 5, maximum: 140}
  validates :text, length: {minimum: 20}
end
