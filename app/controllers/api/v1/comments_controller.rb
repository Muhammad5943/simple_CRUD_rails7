class Api::V1::CommentsController < ApplicationController
    def index
        @comments = Comment.where(article_id: params[:article_id])

        render json: @comments
    end

    def show
        @comment = Comment
                    .where(article_id: params[:article_id])
                    .where(id: params[:id])
                    .first

        render json: @comment
    end

    def create
        @comment = Comment.create(comments_params)
        if @comment.valid?
            render json: @comment
        else
            render json: {
                errors: @comment.errors.full_messages
            }
        end
    end

    def update
        @comment = Comment
                    .where(article_id: params[:article_id])
                    .where(id: params[:id])
                    .first
        
        @comment.update(comments_params)
        if @comment.valid?
            render json: @comment
        else
            render json: {
                errors: @comment.errors.full_messages
            }
        end
    end

    def destroy
        @comment = Comment
                    .where(article_id: params[:article_id])
                    .where(id: params[:id])
                    .first

        @comment.destroy
        redirect_to api_v1_article_comment_path
    end

    private
    def comments_params
        params.permit(:owner, :article_id, :message )
    end
    
end
