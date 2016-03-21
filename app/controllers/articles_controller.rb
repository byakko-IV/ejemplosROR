class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_article, except: [:index,:new, :create]
	#http_basic_authenticate_with name: "byakko", password: "melapelas", except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
	end

	def new
		@article = Article.new
		@categories = Category.all
	end

	def edit
		authorize! :update, @article
	end

	def create
		#render plain: params[:article].inspect //Este metodo muestra el json
		@article = current_user.articles.new(article_params)
		@article.categories = params[:categories]

		if @article.save
			redirect_to @article
		else
			render 'new'
		end

	end

	def update
		if@article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end

	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :text)
	end
end
