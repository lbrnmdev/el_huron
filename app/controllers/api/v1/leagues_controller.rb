module Api
  module V1
    class LeaguesController < ApplicationController
      before_action :set_league, only: [:show, :update, :destroy]

      def index
        leagues = League.all
        render json: leagues, meta: default_meta
      end

      def show
        render json: @league, meta: default_meta
      end

      private

        def set_league
          begin
            @league = League.find params[:id]
          rescue ActiveRecord::RecordNotFound
            league = League.new
            league.errors.add(:id, "Wrong League ID provided")
            render_error(league, 404) and return
          end
        end
    end
  end
end
