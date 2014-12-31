class Admin::ProductsController < Admin::AdminController
  include QRCoder
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :get_categories,only: [:new,:edit]
  before_action :get_customer, only: [:new,:edit]
  def index
    @products = Product.where(flag:true).desc
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    ProductJob.perform_later('create',product_params) 
    redirect_to admin_products_url
  end

  def update
    ProductJob.perform_later('update',product_params,params[:id]) 
    redirect_to admin_products_url
  end

  def download
    ProductJob.perform_later('download',product_params,params[:product_id])
  end

  def rcoder
    path     = Rails.root.to_s + '/public/download/qrcode/'
    system("cd #{path} &&  rm -rf *.tar.gz")
    product  = Product.where(id:params[:product_id]).first
    Product.where(batch:product.batch,mtime:product.mtime,category_id:product.category_id.to_s).each do |pro|
      QRCode.image(pro.id.to_s, path, :format => [:png], :filename => "#{pro.id.to_s}")
    end
    system("cd #{path} && tar zcvf qrcoder.tar.gz  *.png && rm -rf *.png")
    send_file(path + 'qrcoder.tar.gz')
  end




  private

    def set_product
      @product = Product.find(params[:id])
    end


    def product_params
      params.require(:product).permit(:name, :address, :count, :category_id,:material,:mtime,:guarantee,:batch,:description,:flag,:customer_id)

    end

    def get_categories
      @categories = Category.valid 
    end

    def get_customer
      @customers = Customer.valid 
    end
end
