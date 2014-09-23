require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "b606b04a1afb315262ecb7590679d2255731a495d65314ad6f176aa393fd7d99"

	url_format "/media/:job/:name"
	 
	if Rails.env.development? || Rails.env.test?
	  datastore :file,
	            root_path: Rails.root.join('public/system/dragonfly', Rails.env),
	            server_root: Rails.root.join('public')
	else
	  datastore :s3,
	            bucket_name: YOUR_BUCKET_NAME,
	            access_key_id: YOUR_S3_KEY,
	            secret_access_key: YOUR_S3_SECRET,
	            url_scheme: 'https'
	end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end