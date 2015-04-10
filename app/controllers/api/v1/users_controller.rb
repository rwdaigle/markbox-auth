module Api
  module V1
    class UsersController < ApiController

      def access_token
        @user = User.find_by_db_user_id(params[:id])
        if(@user)
          render json: { access_token: @user.db_access_token }
        else
          render json: { access_token: nil }, status: 404
        end
      end
    end
  end
end
