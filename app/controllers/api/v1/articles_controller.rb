module Api
	module V1
		class ArticlesController < ApplicationController
			def index
				articles = Article.order('created_at DESC')
				render json: {status: 'SUCCESS', message: 'Loaded articles', data:articles}, status: :ok
			end
			def show
				articles = Article.find(params[:id])
					render json: {status: 'SUCCESS', message: 'Loaded article', data:articles}, status: :ok
			end
			def create
				articles = Article.new(articles_params)
				
				if articles.save
					render json: {status: 'SUCCESS', message: 'Saved article', data:articles}, status: :ok	
				else					
					render json: {status: 'ERROR', message: 'Article Not Saved', data:articles.errors}, status: :unprocessable_entity
				end
			end
			
			def destroy
				articles = Article.find(params[:id])
				articles.destroy
				render json: {status: 'SUCCESS', message: 'Delete Article', data:articles.errors}, status: :ok
			end

			def update
				articles = Article.find(params[:id])
				if articles.update_attributes(articles_params)
				render json: {status: 'SUCCESS', message: 'Update Article', data:articles}, status: :ok	
				else
					render json: {status: 'ERROR', message: 'Article Not Updated', data:articles.errors}, status: :unprocessable_entity
				end
			end

			private
			def articles_params
				params.permit(:title, :body)
			end			
		end
	end
end