class AuthorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :avatar do |object|
    object.avatar_variant_url if object.avatar.attached?
    # object.avatar_variant.service_url if object.avatar.attached?
    # object.avatar.variant(resize: '100x100').processed.service_url if object.avatar.attached?
  end
end
