module Api
  module V1
    class DomainsController < ApiController

      def access_token
        domain = params[:id]
        if(domain == "ryandaigle.com")
          user = User.find_by_db_user_id("264878654")
          render json: { access_token: user.db_access_token }
        else
          render json: { access_token: nil }, status: 404
        end
      end
    end
  end
end
