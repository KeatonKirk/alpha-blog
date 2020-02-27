module ApplicationHelper
  require 'digest/md5'
  def gravatar_for(user, options = {size: 80})
    hash = Digest::MD5.hexdigest(user.email.downcase.strip)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded-circle")
  end
end
