class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		# @article.save
		if @article.save
			# do something
			flash[:notice] = "Article was created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
		# redirect_to article_path(@article)
	end
   
  def update
  	#render plain: params[:article].inspect
		@article = Article.find(params[:id])
		# @article.save
		if @article.update(article_params)
			# do something
			flash[:notice] = "Article was updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
		# redirect_to article_path(@article)
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash[:notice] = "Article deleted"
		redirect_to articles_path
	end

  private
  def article_params
  	params.require(:article).permit(:title, :description)
  end	

end