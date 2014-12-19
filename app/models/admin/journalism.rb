class Admin::Journalism < Journalism

  def show_status
  	return '已发布' if self.status == VALID
  	return '未发布' if self.status == INVALID 
  end
end
