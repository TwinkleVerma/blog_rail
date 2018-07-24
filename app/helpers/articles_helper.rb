module ArticlesHelper

	def check_whether_user_created_article(article_id)
		current_user.articles.ids.include?article_id
	end

	def get_category_name(article_instance)
		article_instance.category.name
	end

	def count_likes(like_id,like_type)
		like_type.constantize.find(like_id).likes.size
	end  
end
