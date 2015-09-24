class Attraction < ActiveRecord::Base
  validates_presence_of :title, :media
end
