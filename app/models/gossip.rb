class Gossip < ApplicationRecord
  # 1-N association with users table
  belongs_to :user

  # 1-N association with gossip_meta table
  has_many :gossip_meta

  # N-N association with tags table via the gossip_meta table
  has_many :tags, through: :gossip_meta

  # 1-N polymorphic association with comments as commentable
  has_many :comments, as: :commentable

  # 1-N associations with likes
  has_many :likes

  validates :title,
  presence: true,
  length: { in: 3..14, message: 'Le titre ne peut pas faire moins de 3 caractères ni plus de 14 caractères' }

  validates :content,
  presence: true

end
