module Spree::Admin::NavigationHelper
  
  def link_to_validate(resource, options = {})
    url = options[:url] || validate_object_url(resource)
    options[:data] = { action: 'validate' }
    link_to_with_icon('check-circle', t('spree.actions.validate'), url, options)
  end
  
end