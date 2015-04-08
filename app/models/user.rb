class User < ActiveRecord::Base

  attr_encrypted :db_access_token, key: :encryption_key,
    mode: :per_attribute_iv_and_salt, encode: true

  validates_presence_of :db_user_id, :db_access_token

  before_save :set_db_account_info, on: :create

  class << self

    def from_dropbox(db_user_id, db_access_token)
      unless(user = find_by_db_user_id(db_user_id))
        user = create(db_user_id: db_user_id, db_access_token: db_access_token)
      end
      user
    end
  end

  def encryption_key
    @encryption_key ||= ENV["APP_ENCRYPTION_KEY"] || "0a9a105bd887c600d7fda2e80c71ec72f9823af0d5bbf1a5f6f3aed4975b86db"
  end

  private

  def set_db_account_info
    db_account_info = db_client.account_info
    self.db_display_name = db_account_info["display_name"]
    self.db_email = db_account_info["email"]
  end

  def db_client
    @db_client ||= DropboxClient.new(db_access_token)
  end
end
