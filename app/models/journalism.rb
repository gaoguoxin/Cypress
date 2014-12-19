class Journalism
  include Mongoid::Document
  include Mongoid::Timestamps	
  INVALID = 0
  VALID = 1
  
  field :title, type: String
  field :content, type: String
  field :status, type: Integer,default:VALID	
end