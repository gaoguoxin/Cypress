class Admin::ProductsController < Admin::AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :get_categories,only: [:new,:edit]
  def index
    @products = Admin::Product.all
  end

  def show
  end

  def new
    @product = Admin::Product.new
  end

  def edit
  end

  def create
    @product = Admin::Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: '产品创建成功' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: '产品信息更新成功' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: '产品删除成功' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Admin::Product.find(params[:id])
    end

    def product_params
      params.require(:admin_product).permit(:name, :description, :status, :category_id,:image)
    end

    def get_categories
      @categories = Admin::Category.valid 
    end
end
