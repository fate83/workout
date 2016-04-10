class User < ApplicationRecord
  before_create :generate_uuid


  protected
  def generate_uuid
    self.auth_token = SecureRandom.uuid
  end
end
