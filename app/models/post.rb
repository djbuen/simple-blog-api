class Post < ActiveRecord::Base
 belongs_to :user
 has_many :comments

 def as_json
  super.merge({
    :comments => self.comments.as_json
  })
 end
end
