class User < ActiveRecord::Base
  # validates :name, :uid, :provider, presence: true
  
  def self.find_or_create_from_omniauth(auth_hash)
    # the uid, the provider and the name of that user
    user = self.find_by(uid: auth_hash['uid'], provider: auth_hash['provider'])

    # Find or create a user
    # user = //something else here//
    if !user.nil?
    # return user that was found
      return user

    else
    # no user found, do this:
    user = User.new
    user.uid = auth_hash['uid']
    user.provider = auth_hash["provider"]
    user.name = auth_hash["info"]["name"]
    user.email = auth_hash["info"]["email"]

      if user.save
          return user
        else
          return nil
      end
    end
  end
end
