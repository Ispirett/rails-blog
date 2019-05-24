class Article < ApplicationRecord
  has_many :comments , dependent: :destroy
  has_many :taggings , dependent: :destroy
  has_many :tags , through: :taggings , dependent: :destroy

  has_attached_file :image, dependent: :destroy
  validates_attachment_content_type :image, :content_type => ['image/jpg', "image/jpeg","image/png"]

  def tag_list
    self.tags.collect do

    |tags| tags.name end.join(",")
  end

  def tag_list=(tag_string)
    entered_tags = tag_string.split(",").collect { |t| t.strip.downcase }.uniq
    new_tags = entered_tags.collect { |tags| Tag.find_or_create_by(name: tags) }
    self.tags = new_tags
    
  end

end
