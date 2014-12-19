class Admin::Product < Product
	def show_status
  		return '有效' if self.status == Product::VALID
  		return '无效' if self.status == Product::INVALID  	
 	end
end
