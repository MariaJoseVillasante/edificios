class Blog < ApplicationRecord
    paginates_per 20

    validates :title, presence: true
    validates :image_url, presence: true
    validates :content, presence: true
    validates :status, presence: true

    enum status: [:draft, :published]
end
