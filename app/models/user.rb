class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :mobile, type: String
  field :password, type: String
  field :status, type: Integer

  def self.login(opt)
  	crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
  	user  = self.where(mobile:opt[:mobile]).first
  	return user if crypt.decrypt_and_verify(user.password) ==  opt[:password]	
  	return nil
  end

  def self.create_admin(mobile,pwd)
  	crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
  	password = crypt.encrypt_and_sign(pwd)
  	self.create(mobile:mobile,password:password)
  end

end
