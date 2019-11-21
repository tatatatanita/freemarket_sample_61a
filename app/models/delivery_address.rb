class DeliveryAddress < ApplicationRecord
  belongs_to :user, class_name: 'User'

  # validates :last_name_kanji,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/},   on: :save_step3_to_session
  # validates :first_name_kanji,        presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/},   on: :save_step3_to_session
  # validates :last_name_kana,          presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}, on: :save_step3_to_session
  # validates :first_name_kana,         presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}, on: :save_step3_to_session
  # validates :postal_code,             presence: true, format: {with: /\A\d{7}\z/},           on: :save_step3_to_session
  # validates :prefectures,             presence: true, on: :save_step3_to_session
  # validates :city,                    presence: true, on: :save_step3_to_session
  # validates :address,                 presence: true, on: :save_step3_to_session
end
