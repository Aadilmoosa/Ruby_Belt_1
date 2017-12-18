class User < ActiveRecord::Base

  # relationships:
  has_many :songs
  has_many :adds, dependent: :destroy
  has_many :songs_added, through: :adds, source: :song

  has_secure_password
  
  before_save :downcase

  validates :first_name, :last_name, presence: true
  validates :email,
    uniqueness: { case_sensitive: false },
    presence: true,
    format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  def downcase
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end
