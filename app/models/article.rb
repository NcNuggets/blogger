class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

=begin

    PSEUDO CODE FOR tag_list=

    Split the tags_string into an array of strings with leading and trailing whitespace removed (so "tag1, tag2, tag3" would become ["tag1","tag2","tag3"]
    For each of those strings…
        Ensure each one of these strings are unique
        Look for a Tag object with that name. If there isn’t one, create it.
        Add the tag object to a list of tags for the article
    Set the article’s tags to the list of tags that we have found and/or created.

=end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect{|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end

end
