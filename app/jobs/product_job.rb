class ProductJob < ActiveJob::Base
  queue_as :cypress

  def perform(type,opt,pid=nil)
  	if type == 'create'
    	1.upto(opt[:count].to_i) do |i|
			Product.create(opt)
		end  		
  	elsif(type == 'update')
		product = Product.where(id:pid).first
		Product.where(batch:product.batch,mtime:product.mtime,category_id:product.category_id.to_s).each do |prod|
			prod.update(opt)
		end
	elsif(type == 'download')	
  	end

  end
end

