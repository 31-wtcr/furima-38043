FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code {"123-4567"}
    prefecture {2}
    city {"青森市"}
    address {"3-5"}
    building_name {"北ビル"}
    phone_number {"09876543210"}
    token {"tok_abcdefghijklmnopqrstuvwxyz"}
  end
end
