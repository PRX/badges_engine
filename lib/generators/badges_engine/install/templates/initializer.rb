BadgesEngine::Configuration.setup do |config|
  config.issuer = {
    :origin=>'http://example.com',
    :name=>'Example Company',
    :org=>'My Organization',
    :contact=>'me@example.com'
  }
  config.baker_url = 'http://beta.openbadges.org/baker'
  config.badge_version = '0.5.0'
  config.user_class = User
end
