class Journalism
  include Mongoid::Document
  include Mongoid::Timestamps	
  INVALID = 0
  VALID = 1

  mount_uploader :image, JournalismsUploader

  field :title, type: String
  field :content, type: String
  field :image,type: String
  field :status, type: Integer,default:VALID	

  scope :valid ->{where(status:VALID)}
end