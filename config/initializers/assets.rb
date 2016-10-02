# Be sure to restart your server when you modify this file.

# Enable the asset pipeline
Kalbermatter::Application.config.assets.enabled = true

# Version of your assets, change this if you want to expire all your assets
Kalbermatter::Application.config.assets.version = "1.0"
# Don't load the app when precompiling assets (Mostly for Heroku)

Kalbermatter::Application.config.assets.initialize_on_precompile = false
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
