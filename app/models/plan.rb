class Plan < ActiveRecord::Base
  validates :paypal_description, length: { maximum: 120 }

  def paypal_description=(value)
    write_attribute(:paypal_description, I18n.transliterate(value))
  end

  def to_s
    name
  end
end
