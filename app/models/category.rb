class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  INVALID = 0
  VALID = 1
  
  field :name, type: String
  field :status, type: Integer,default:VALID

  has_many :products, class_name: 'Product'

  scope :valid, ->{where(status:VALID)}

  def show_status
  	return '已发布' if status == VALID
  	return '未发布' if status == INVALID
  end

end
