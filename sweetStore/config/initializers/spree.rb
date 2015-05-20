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

