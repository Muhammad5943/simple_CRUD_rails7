class Api::V1::ArticlesController < ApplicationController
    def index
        @articles = Article
                            .includes(:comments)
                            .all
        
        render json: @articles
    end

    def show
        @article = Article
                            .includes(:comments)
                            .where(id: params[:id])
                            .first

        render json: @article
    end

    def create
        @article = Article.create(article_params)
        if @article.valid?
            render json: @article
        else
            render json: {
                errors: @article.errors.full_messages
            }
        end
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        if @article.valid?
            render json: @article
        else
            render json: {
                errors: @article.errors.full_messages
            }
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to_api_v1_articles_path
    end

    private
    def article_params
        params.permit(:title, :description)
    end
    
end
