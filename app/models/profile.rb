class Profile < ApplicationRecord
		belongs_to :user

	  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :firstname, :lastname, :age, :avatar, presence: true
  validates :age, numericality: { only_integer: true }
  
end
