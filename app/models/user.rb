class User < ApplicationRecord
  before_save :downcase_email, unless: :uid?
  validates :name, presence: true, length: { maximum: 50 }, unless: :uid?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false },
            unless: :uid?
  validates :password, presence: true, length:{ minimum: 6 }, allow_nil: true, unless: :uid?
  has_secure_password　unless: :uid?
  has_many :ownerships
  has_many :items, through: :ownerships
  has_many :wants
  has_many :want_items, through: :wants, source: :item
  has_many :desires
  has_many :desire_items, through: :desires, source: :item
  
  def downcase_email
    self.email = email.downcase
  end
  
  def want(item)
    self.wants.find_or_create_by(item_id: item.id)
  end

  def unwant(item)
    want = self.wants.find_by(item_id: item.id)
    want.destroy if want
  end

  def want?(item)
    self.want_items.include?(item)
  end

  def desire(item)
    self.desires.find_or_create_by(item_id: item.id)
  end

  def undesire(item)
    desire = self.desires.find_by(item_id: item.id)
    desire.destroy if desire
  end

  def desire?(item)
    self.desire_items.include?(item)
  end

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    image = auth[:info][:image]
    
    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.image_url = image
    end
  end
end