class Comment < ActiveRecord::Base
 belongs_to :post
 belongs_to :user

 def as_json(params)
  super.merge({
  :user => self.user
  })
 end
end
