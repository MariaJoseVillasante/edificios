class Post < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true
    validates :content, presence: true
    # scope :scope_name, -> {where(attribute:value)}
    #scope :find_valid, -> { where("age > ?", 20)}
    paginates_per 20
    # gsub
    def delete_spoiler
        # @post.content = @post.content.gsub("spoiler", "")
    end
end