class Message
  include Mongoid::Document
  include Mongoid::Timestamps	

  field :username, type: String
  field :email, type: String
  field :phone,type: String
  field :content, type: String
end