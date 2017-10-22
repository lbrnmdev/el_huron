module Api
  module V1
    class TableEntriesController < ApplicationController
      before_action :set_table_entry, only: [:show, :update, :destroy]

      def index
        table_entries = TableEntry.all
        render json: table_entries, meta: default_meta
      end

      def show
        render json: @table_entry, meta: default_meta
      end

      private

        def set_table_entry
          begin
            @table_entry = TableEntry.find params[:id]
          rescue ActiveRecord::RecordNotFound
            table_entry = TableEntry.new
            table_entry.errors.add(:id, "Wrong TableEntry ID provided")
            render_error(table_entry, 404) and return
          end
        end
    end
  end
end
