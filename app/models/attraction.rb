class Attraction < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :media

  scope :coming, ->{ where('day >= ?', Time.now).order(:day) }
  scope :past,   ->{ where('day < ?', Time.now).order(:day => :desc)  }

  delegate :nick_name, :email, :to => :user, prefix: true
end
