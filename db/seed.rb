# db/seeds.rb

# Create a few users with IP address, lang, and country_iso_code data
Api::User.create!(
  ip_address: '192.168.1.100',
  lang: 'en',
  country_iso_code: 'US'
)

Api::User.create!(
  ip_address: '10.0.0.1',
  lang: 'es',
  country_iso_code: 'ES'
)

Api::User.create!(
  ip_address: '172.16.0.1',
  lang: 'fr',
  country_iso_code: 'FR'
)

# Add more users as needed...
