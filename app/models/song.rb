class Song < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  
  belongs_to :user
  has_many :adds, dependent: :destroy
  has_many :users, through: :adds
  before_save :downcase
  
  validates :title, :artist, presence: true, length: { in: 2..20 }

  def downcase
    self.title.downcase!
    self.artist.downcase!
  end

end
