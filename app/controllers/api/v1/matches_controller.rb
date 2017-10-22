module Api
  module V1
    class MatchesController < ApplicationController
      before_action :set_match, only: [:show, :update, :destroy]

      def index
        matches = Match.all
        render json: matches, meta: default_meta
      end

      def show
        render json: @match, meta: default_meta
      end

      private

        def set_match
          begin
            @match = Match.find params[:id]
          rescue ActiveRecord::RecordNotFound
            match = Match.new
            match.errors.add(:id, "Wrong Match ID provided")
            render_error(match, 404) and return
          end
        end
    end
  end
end
