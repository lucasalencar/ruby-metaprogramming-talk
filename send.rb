class Music
  def full_version
    <<-MUSIC
    This is the rhythm of the night
    The night, oh, yeah
    The rhythm of the night

    This is the rhythm of my life
    My life, oh, yeah
    The rhythm of my life

    You could put some joy upon my face
    Oh, sunshine in an empty place
    Take me to turn to
    And, babe, I'll make you stay
    MUSIC
  end

  def summary
    full_version[/(.*)\n/].chomp.strip
  end

  def content(version)
    send(version)
  end
end

music = Music.new

puts music.full_version
puts music.summary

puts music.content(:summary)

require 'pry'; binding.pry
