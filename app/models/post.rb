class Post < ActiveRecord::Base
	def user_params
      params.require(:post).permit(:title, :content)
    end
    validates :title, :content, presence:true
    validates :title, length:{minimum:2}
    validates :title, uniqueness:{:message=>"Already taken"}
end
