class Admin::JournalismsController < Admin::AdminController
  before_action :set_admin_journalism, only: [:show, :edit, :update, :destroy]

  def index
    @admin_journalisms = Admin::Journalism.all
  end


  def show
  end

  def new
    @admin_journalism = Admin::Journalism.new
  end

  def edit
  end

  def create
    @admin_journalism = Admin::Journalism.new(admin_journalism_params)

    respond_to do |format|
      if @admin_journalism.save
        format.html { redirect_to @admin_journalism, notice: '新闻创建成功.' }
        format.json { render :show, status: :created, location: @admin_journalism }
      else
        format.html { render :new }
        format.json { render json: @admin_journalism.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_journalism.update(admin_journalism_params)
        format.html { redirect_to @admin_journalism, notice: '新闻修改成功.' }
        format.json { render :show, status: :ok, location: @admin_journalism }
      else
        format.html { render :edit }
        format.json { render json: @admin_journalism.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_admin_journalism
      @admin_journalism = Admin::Journalism.find(params[:id])
    end

    def admin_journalism_params
      params.require(:admin_journalism).permit(:title, :content,:status,:image)
    end
end
