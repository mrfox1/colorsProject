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

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true
  validates :title, length: {minimum: 5, maximum: 140}
  validates :text, length: {minimum: 10}

  scope :newest, -> { order(:created_at).reverse }

  def self.create_tags(params, post)
    params.split(',').each do |tag|
      Tag.where(name: tag.strip).first_or_create!
      create_post_tag(tag, post)
    end
  end

  def self.create_post_tag(tag, post)
    t = Tag.find_by_name(tag.strip).id
    PostTag.create(post_id: post.id, tag_id: t)
  end
end
