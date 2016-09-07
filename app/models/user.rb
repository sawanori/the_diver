class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :blogs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable


 private
 def confirmation_token
       if self.confirm_token.blank?
           self.confirm_token = SecureRandom.urlsafe_base64.to_s
       end
 end
end
