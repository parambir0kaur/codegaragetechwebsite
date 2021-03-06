class BlogsController <  ApplicationController

before_action :authenticate_admin!, only: [ :create, :new, :edit]
  def index
    @blogs = Blog.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @blog = Blog.friendly.find(params[:id])
    @blogs=Blog.all.last(3)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.friendly.find(params[:id])
  end
  def update
    @blog = Blog.friendly.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

    def destroy
      @blog = Blog.friendly.find(params[:id])
      @blog.destroy

      redirect_to blogs_path
    end

  private
    def blog_params
      params.require(:blog).permit(:title, :text,:image,:date_blog)
    end
end
