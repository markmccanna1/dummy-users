require 'digest/sha1'

class User < ActiveRecord::Base
  before_save :hash_pw
  validates :user_name, :user_password, presence: true
  validates :user_name, uniqueness: true, length: { in: 5..16 }
  validates :user_password, length: { in: 5..32 }

  def check_pw(user_input)
    enter_pw = Digest::SHA1.hexdigest(user_input)
    return enter_pw == self.user_password
  end

  private

  def hash_pw
    self.user_password = Digest::SHA1.hexdigest self.user_password
  end
end
