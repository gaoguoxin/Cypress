class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :flag, type: Boolean
  field :name, type: String #商品名称
  field :address, type: String #产地
  field :count, type: Integer #产量
  field :material,type: String #原料
  field :mtime,type:String #出厂时间
  field :guarantee,type:String #保质期
  field :description, type: String #描述
  field :batch,type:Integer #批次
  field :target,type:String #目的地
  field :process, type:Array #跟踪信息
  
  belongs_to :category, class_name: 'Category' 
  belongs_to :customer,class_name:'Customer'

  before_create :check_flag

  #flag 为某个批次的第一个商品
  def check_flag
    has_flag = Product.where(name:name,address:address,count:count,mtime:mtime,batch:batch).first
    unless has_flag.present?
      self.flag = true
    end
  end

  #process format
  # [
  #   {uname:'快递员姓名',event_type:'接收物品',event_time:'事件时间',event_address:'事件发生地点',description:'事件描述信息'},
  #   {},
  #   {},
  #   {},
  #   {}
  # ]

end
