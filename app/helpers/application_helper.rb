module ApplicationHelper
  def gravatar_url(email, size)
    digest = email.blank? ? "0" * 32 : Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{digest}?d=mm&s=#{size}"
  end

  def gravatar_image_tag(player, size: 24, **options)
    # retina
    image_tag(gravatar_url(player.email, size*2), { **options, size: size })
  end

  def format_time(time)
    "#{time_ago_in_words(time)} ago"
  end

  def setup_by
    ENV['SETUP_BY'] || 'Elovation'
  end
end
