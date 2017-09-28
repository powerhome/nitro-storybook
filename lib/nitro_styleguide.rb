require "jquery-rails"
require "sassc-rails"
require "bootstrap-sass"
require "font-awesome-sass"
require "simple_form"
require "will_paginate"
require "will_paginate/bootstrap"

require "nitro-styleguide/engine"



module NitroStyleguide
  # @return [Boolean] indication of whether the request is a web view within Nitro Mobile
  def self.web_page_within_mobile_app?(request)
    # Nitro {
    #  "os_version":"8.3.0",
    #  "os":"iOS",
    #  "device":"iPhone6,1",
    #  "app_id":"com.powerhrg.nitro.dev",
    #  "build_number":"1098",
    #  "version_number":"3.2.0"
    # }
    request.user_agent.try(:downcase) =~ /^nitro/
  end

  # @return [String] the digest value for assets managed by the asset pipeline
  def self.assets_digest
    @assets_digest ||= begin
      if ActionView::Base.respond_to?(:asset_manifest) # Rails 4
        Digest::MD5.hexdigest(ActionView::Base.assets_manifest.assets.values.sort.join)
      elsif Rails.configuration.assets.digests.present? # Rails 3
        Digest::MD5.hexdigest(Rails.configuration.assets.digests.try(:values).sort.join)
      end
    end
  end
end
