class CourseContract < ActiveRecord::Base
  has_and_belongs_to_many :courses
  
  validates_presence_of :name
  
  before_create :generate_slug
  
  def generate_slug
    # Remove single quotes from input
    self.slug = self.name.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s
    
    # Remove single quotes from input
    self.slug.gsub!(/[']+/, '')

    # Replace any non-word character (\W) with a space
    self.slug.gsub!(/\W+/, ' ')
    
    # Remove any whitespace before and after the string
    self.slug.strip!
    
    # All characters should be downcased
    self.slug.downcase!
    
    # Replace spaces with dashes
    self.slug.gsub!(' ', '-')
    self.slug.gsub!(/[']+/, '')

    # Replace any non-word character (\W) with a space
    self.slug.gsub!(/\W+/, ' ')
    
    # Remove any whitespace before and after the string
    self.slug.strip!
    
    # All characters should be downcased
    self.slug.downcase!
    
    # Replace spaces with dashes
    self.slug.gsub!(' ', '-')
  end
end