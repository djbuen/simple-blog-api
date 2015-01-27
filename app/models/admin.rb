class Admin < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  before_save -> do
    self.uid = SecureRandom.uuid
    self.is_admin = true
    skip_confirmation!
  end
end
