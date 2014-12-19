class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :image, ProductImageUploader
  	
  VALID = 1
  INVALID = 0  	

  field :name, type: String
  field :image,type: String
  field :description, type: String
  field :status, type: Integer,default: VALID
  
  belongs_to :category, class_name: 'Category' 
end