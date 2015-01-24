class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable , :omniauthable
  before_save -> { skip_confirmation! }
  attr_accessor :username, :confirm_success_url, :config_name, :registration
end
