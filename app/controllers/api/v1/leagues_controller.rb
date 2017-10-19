module Api
  module V1
    class LeaguesController < ApplicationController
      def index
        leagues = League.all
        render json: leagues, meta: default_meta
      end
    end
  end
end