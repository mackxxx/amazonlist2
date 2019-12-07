class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length:{ minimum: 6 }, allow_nil: true
  has_secure_password
  has_many :ownerships
  has_many :items, through: :ownerships
  has_many :wants
  has_many :want_items, through: :wants, source: :item
  has_many :desires
  has_many :desire_items, through: :desires, source: :item
  
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
end