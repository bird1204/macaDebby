# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
# Rails.application.config.spree.payment_methods << YourCustomGateway


Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  # config.logo = 'logo.png'
  config.admin_interface_logo = 'logo_small.png'
end
Spree.user_class = "Spree::User"
# Spree::PrintInvoice::Config.set(logo_path: 'logo.png')
# Spree::PrintInvoice::Config.set(next_number: ['1'|'your current next invoice number'])
# Spree::PrintInvoice::Config.set(print_buttons: 'invoice,packaging_slip') # comma separated list
#   print_buttons: 'invoice,packaging_slip',
#   page_layout: 'landscape',
#   page_size: 'A4',
#   store_pdf: true,
#   storage_path: 'pdfs/orders',
#   footer_left: 'footer_left',
#   footer_right: 'footer_right',
#   return_message: 'return_message',
#   anomaly_message: 'anomaly_message',
#   use_footer: true,
#   logo_scale: 18
# )
# Spree::PrintInvoice::Config.set(store_pdf: true) # Default: false
# Spree::PrintInvoice::Config.set(storage_path: 'pdfs/orders') # Default: tmp/order_prints
# Spree::PrintInvoice::Config.set(suppress_anonymous_address: 'suppress_anonymous_address')

attachment_config = {

  s3_credentials: {
    access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    bucket:            ENV['S3_BUCKET_NAME']
  },

  storage:        :s3,
  s3_headers:     { "Cache-Control" => "max-age=31557600" },
  s3_protocol:    "https",
  bucket:         ENV['S3_BUCKET_NAME'],
  url:            ":s3_domain_url",

  styles: {
      mini:     "48x48>",
      small:    "100x100>",
      product:  "240x240>",
      large:    "600x600>"
  },

  path:           "/:class/:id/:style/:basename.:extension",
  default_url:    "/:class/:id/:style/:basename.:extension",
  default_style:  "product"
}

attachment_config.each do |key, value|
  #Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
end

