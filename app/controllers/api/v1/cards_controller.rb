module Api
  module V1
    class CardsController < ApplicationController
      def index
        cards = Card.order('created_at DESC')
        render json: { status: 'success', data: cards }, status: :ok
      end

      def show
        card = Card.find(params[:id])
        render json: { status: 'success', data: card }, status: :ok
      end

      def create
        card = Card.new(params.permit(:title, :description))
        if card.save
          render json: { status: 'success', data: card }, status: :ok
        else
          render json: { status: 'error', data: card.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        card = Card.find(params[:id])
        card.destroy
        render json: { status: 'success', data: card }, status: :ok
      end

      def update 
        card = Card.find(params[:id])
        if card.update_attributes(params.permit(:title, :description))
          render json: { status: 'success', data: card }, status: :ok
        else 
          render json: { status: 'error', data: card.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
