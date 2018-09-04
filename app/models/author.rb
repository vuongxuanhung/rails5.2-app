class Author < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :avatar

  validates :name, presence: true
  validate :require_avatar


  def avatar_variant(width: 400, height: 300)
    variation = ActiveStorage::Variation.new(FileProcessor.resize_to_fit(width: width, height: height, blob: avatar.blob))
    ActiveStorage::Variant.new(avatar.blob, variation).processed
  end

  def avatar_url
    ActiveStorage::Current.set(host: Rails.application.routes.default_url_options[:host]) do
      rails_blob_path(avatar)
    end
  end

  def avatar_variant_url
    ActiveStorage::Current.set(host: Rails.application.routes.default_url_options[:host]) do
      rails_representation_url(avatar_variant)
    end
  end

  private

  def require_avatar
    errors.add(:avatar, 'is required') unless self.avatar.attached?
  end
end
