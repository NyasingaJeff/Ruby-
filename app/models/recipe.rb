class Recipe < ActiveRecord::Base
    # relatonship to user class 
    belongs_to :user
    has_many :likes , dependent: :destroy
    has_many :recipe_styles ,  dependent: :destroy#delete the relationship at the joining table
    has_many :styles, through: :recipe_styles 
    has_many :recipe_ingredients  ,  dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    validates :user_id, presence: true
    validates :name, presence: true, length: { minimum: 5, maximum: 100 }
    validates :summary, presence: true, length:{minimum:10, maximum: 150}
    validates :description, presence: true, length: {minimum:20 , maximum:500 }
    mount_uploader :picture, PictureUploader  #Added after uploader
    validate :picture_size
    #this is instruct active record how to pick,. the creteria
    default_scope -> {order(updated_at: :desc)} #this would tell the active record to pick the recordsd in order of date of udate, in desc order
    def thumbs_up_counter
        self.likes.where(like: true).size
    end
    def thumbs_down_counter
        self.likes.where(like: false).size
    end
    private
        def picture_size
            if picture.size>5.megabytes
                errors.add(:picture, "The picture is too big.. shuld be less than 5MB")                
            end
        end
end