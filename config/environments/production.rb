# config/environments/production.rb
require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true
  # Redirect all HTTP → HTTPS and set secure cookies
  config.force_ssl = true

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # config.require_master_key = true

  # Static files (Heroku sets RAILS_SERVE_STATIC_FILES)
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # Do not fallback to the asset pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # config.asset_host = "http://assets.example.com"

  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # Active Storage
  config.active_storage.service = :local

  # Force SSL (enable once your app is behind HTTPS always)
  # config.force_ssl = true

  config.log_level = :info
  config.log_tags = [:request_id]

  # config.cache_store = :mem_cache_store

  # Active Job
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "light_and_peace_production"

  # ---- Action Mailer (SendGrid via Heroku) ----
  config.action_mailer.perform_caching = false
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

  # Set URL options for links in emails (host/protocol can be overridden via ENV)
  config.action_mailer.default_url_options = {
    host: ENV.fetch("MAILER_HOST", "light-and-peace.herokuapp.com"),
    protocol: ENV.fetch("MAILER_PROTOCOL", "https")
  }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              "smtp.zoho.com.au",
    port:                 587,
    domain:               "lightandpeacespiritism.org",
    user_name:            ENV["ZOHO_USERNAME"], # your Zoho email address
    password:             ENV["ZOHO_PASSWORD"], # your Zoho password or app password
    authentication:       :plain,
    enable_starttls_auto: true
  }


  # ---------------------------------------------

  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
