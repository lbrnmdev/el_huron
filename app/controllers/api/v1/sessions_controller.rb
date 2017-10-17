module Api
  module V1
    class SessionsController < ApplicationController

      def create
        data = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        # Rails.logger.error params.to_yaml
        user = User.where(username: data[:username]).first
        head 406 and return unless user
        if user.authenticate(data[:password])
          user.regenerate_auth_token
          # TODO make this organic!! currently dirty way to return logged in status since default only checks for current user (there is none) status at beginning of create action
          logged_in_meta = default_meta
          logged_in_meta[:logged_in] = true
          render json: user, status: :created, meta: logged_in_meta,
                 serializer: ActiveModel::Serializer::SeshSerializer and return
        end
        # TODO include helpful message regarding login failure
        head 403
      end
    
      def destroy
        user = User.where(auth_token: params[:id]).first
        head 404 and return unless user
        user.regenerate_auth_token
        head 204
      end

    end
  end
end