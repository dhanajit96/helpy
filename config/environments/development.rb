Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  #config.i18n.default_locale = :en

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  #config.consider_all_requests_local       = false
  #config.action_controller.perform_caching = false
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.default_url_options = { host: Settings.site_url }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Disable database query caching
  # (this will highlight inefficient queries in development)
  config.middleware.delete 'ActiveRecord::QueryCache'

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  #config.action_view.raise_on_missing_translations = false
  config.action_view.raise_on_missing_translations = true

  config.i18n.available_locales = [:en, :es, :de, :fr, :it, :et, :ca, :sv, :hu, :ru, :ja, :hi, 'zh-cn', 'zh-tw', 'pt', :nl, 'tr', 'pt-br', :fa, :fi, :id, :ar, :ko, :ms, :uk]
  config.i18n.default_locale = :en
  config.i18n.fallbacks = true

  config.active_job.queue_adapter = :inline

  config.after_initialize do
    # Bullet Configuration / https://github.com/flyerhzm/bullet
    # Bullet.enable = true
    # Bullet.bullet_logger = true
    # Bullet.add_footer = true
  end

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
