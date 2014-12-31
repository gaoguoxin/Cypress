class Customer
  include Mongoid::Document
  include Mongoid::Timestamps

  INVALID = 0
  VALID = 1
  
  field :username, type: String #供应商姓名
  field :address, type: String #收货地址
  field :remain, type:Hash #每个客户可能会有赠送的产品,每寄送一批都会有一件赠送的产品，如果用户要这个产品，则该类的值减一，该字段标示可能有多种产品{category_id1:100,category_id2:120}
  field :status, type: Integer,default:VALID

  scope :valid, ->{where(status:VALID)}

  has_many :products

  def show_status
  	return '合作中' if status == VALID
  	return '已终止' if status == INVALID
  end


  def show_remain
    str = ''
    if remain.present?
      remain.each_pair do |k,v|
        category = Cateogry.find(k)
        cname = category.name
        str += cname + ":" + k.to_s + ' '
      end
    end
    return str
  end

end
