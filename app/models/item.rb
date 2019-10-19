class Item < ApplicationRecord
  validates :code, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }
  has_many :ownerships
  has_many :users, through: :ownerships
  has_many :wants
  has_many :want_users, through: :wants, source: :user
  has_many :desires
  has_many :desire_users, through: :desires, source: :user


  def self.initialize_by_json(json)
    new(
      code: json['itemCode'],
      name: json['itemName'],
      url: json['itemUrl'],
      image_url: json['mediumImageUrls'].first.gsub('?_ex=128x128', '')
    )
  end
end