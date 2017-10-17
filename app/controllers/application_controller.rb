class ApplicationController < ActionController::API
  before_action :check_header
  before_action :validate_login

  private

    def check_header
      if ['POST','PUT','PATCH'].include? request.method
        if request.content_type != "application/vnd.api+json"
          head 406 and return
        end
      end
    end

    def validate_type
      if params['data'] && params['data']['type']
        if params['data']['type'] == (params[:controller]).sub(/^api\/v\d\//, '') # remove 'api/v#{digit}' portion of controller name 
          return true
        end
      end
      head 409 and return
    end

    def validate_login
      auth_token = request.headers["X-Api-Key"]
      return unless auth_token
      user = User.find_by auth_token: auth_token
      return unless user
      if 15.minutes.ago < user.updated_at
        user.touch
        @current_user = user
      end
    end
  
    def validate_user
      head 403 and return unless @current_user
    end

    def render_error resource, status
      render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end

    def default_meta
      {
        licence: 'no idea yet',
        authors: ['lbrnm'],
        logged_in: (@current_user ? true : false)
      }
    end

    # TODO ensure logged out clients can only perform create user action
    # TODO ensure logged in user can only perform action relating to own profile 
end
