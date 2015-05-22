module Api
  module V1
    class DomainsController < ApiController

      def access_token
        user = User.find_by_db_user_id("264878654")
        render json: { access_token: user.db_access_token }
      end
    end
  end
end
