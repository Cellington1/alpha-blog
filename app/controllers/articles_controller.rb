class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		#render plain: params[:article].inspect
		#debugger
		@article = Article.new(article_params)
		@article.user = User.first
		# @article.save
		if @article.save
			# do something
			flash[:success] = "Article was created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
		# redirect_to article_path(@article)
	end
   
  def update
  	#render plain: params[:article].inspect
		# @article.save
		if @article.update(article_params)
			# do something
			flash[:success] = "Article was updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
		# redirect_to article_path(@article)
	end

	def show
	end

	def destroy
		@article.destroy

		flash[:danger] = "Article deleted"
		redirect_to articles_path
	end

  private
  def article_params
  	params.require(:article).permit(:title, :description)
  end	
  
  private
  def set_article
  	@article = Article.find(params[:id])
  end

end