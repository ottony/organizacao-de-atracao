class User < ActiveRecord::Base
  include Clearance::User

  has_many :attractions
  after_create :send_confirmation_email
  before_create :set_confirmation_token

  def confirm token
    return unless token == self.confirmation_token

    update_attributes confirmed_at: Time.now
  end

  def confirmed?
    not confirmed_at.nil?
  end

  private 

  def set_confirmation_token
    self.confirmation_token = Clearance::Token.new
  end

  def send_confirmation_email
    UserMailer.welcome_mail( self ).deliver_now
  end
end
