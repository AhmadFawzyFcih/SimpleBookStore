class Book < ApplicationRecord

    mount_uploader :cover_image , ImageUploader

    #*** Relations ***
    has_many :pages
    belongs_to :user
    #*** scopes ***
    scope :visible           , lambda { where(:visible => true) }
    scope :sortedByPosition  , lambda { order(:position => :asc) }
    scope :sortedByName      , lambda { order(:name => :asc) }

    #*** validations ***
    validates :name , presence: { message: "must be given please" }, :length   => {:within => 8..300} 
    validates :cover_image ,file_size: { less_than_or_equal_to: 100000.kilobytes }, #megabytes or kilobytes
                            file_content_type: { allow: ['image/jpeg', 'image/png' , 'image/jpg'] }
 
    #*** new functions ***
    # def new_cover_image
    #     cover_image ? cover_image : "https://dontgiveupworld.com/wp-content/uploads/2013/10/Facebook-cover-photo-on-life20.png"
    # end
end
