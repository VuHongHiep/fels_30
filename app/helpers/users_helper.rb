module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
  	if(user.avatar == "" or user.avatar == nil) then
  	  image_tag("avatar_default.png", alt: user.name, class: "gravatar")	
  	else
  	  image_tag(user.avatar, alt: user.name, class: "gravatar")	
  	end
  end
end
