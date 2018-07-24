module LikeHelper
	
  def enitity_liked(likeable_type, likeable_id)
    Like.where(like_type: likeable_type, like_id: likeable_id, user_id: current_user.id).present?    
  end	
  
end
