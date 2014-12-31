class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all
  end


  def show
  end

  def new
    @category = Category.new
  end


  def edit
  end


  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_path(@category), notice: '新分类创建成功.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_category_path(@category), notice: '分类修改成功.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: '分类删除成功.' }
      format.json { head :no_content }
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :status)
    end
end
