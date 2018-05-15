# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  text        :text
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  category_id :integer
#  views       :integer          default(0)
#  rating      :integer          default(0)
#

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :title, length: {minimum: 5, maximum: 140}
  validates :text, length: {minimum: 10}

  scope :newest, -> { order(:created_at).reverse }
end
