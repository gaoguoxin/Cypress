class Admin::CustomersController < Admin::AdminController
	before_action :set_customer, only: [:show, :edit, :update, :destroy]
    
   
	def index
		@customers = Customer.desc(:created_at)
	end

	def new
		@customer = Customer.new
	end

	def show
	end

	def edit
	end



	def create
    	@customer = Customer.new(customer_params)
    	respond_to do |format|
    	  if @customer.save
    	    format.html { redirect_to admin_customer_url(@customer), notice: '经销商创建成功' }
    	    format.json { render :show, status: :created, location: @customer }
    	  else
    	    format.html { render :new }
    	    format.json { render json: @customer.errors, status: :unprocessable_entity }
    	  end
    	end
	end

	def update
    	respond_to do |format|
    	  if @customer.update(customer_params)
    	    format.html { redirect_to admin_customer_url(@customer), notice: '经销商修改成功.' }
    	    format.json { render :show, status: :ok, location: @customer }
    	  else
    	    format.html { render :edit }
    	    format.json { render json: @customer.errors, status: :unprocessable_entity }
    	  end
    	end
	end

	private
    def set_customer
    	@customer = Customer.find(params[:id])
    end	

    def customer_params
		params.require(:customer).permit(:username, :address, :remain, :status)
    end

end