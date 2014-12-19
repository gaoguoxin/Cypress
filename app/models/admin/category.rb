class Admin::Category < Category
  include Mongoid::Document
  include Mongoid::Timestamps

  def show_status
  	return '有效' if self.status == VALID
  	return '无效' if self.status == INVALID 
  end
end
