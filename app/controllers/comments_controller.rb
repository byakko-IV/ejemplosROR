class CommentsController < ApplicationController
	before_action :set_article, only: [:create, :destroy]
	before_action :set_comment, only: [:show]
	before_action :authenticate_user!, only:[:create, :destroy]
	#http_basic_authenticate_with name: "byakko", password: "melapelas", except: [:index, :show]

	def show
	end

	def create
		@comment = current_user.comments.new(comment_params)
		@comment.article = @article

		respond_to do |format|
			if @comment.save
				format.html { redirect_to article_path(@article), notice: "Tu comentario fue agregado exitosamente"}
				format.json { render :show, status: :created, location: @comment.article }
			else
				format.html { render :new }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@comment = current_user.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def set_article
		@article = Article.find(params[:article_id])
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end
