class String

  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def fancy(color_code, second)
    "\e[#{color_code}m#{self}\e[#{second}m"
  end

  def underline
    fancy(4,24)
  end

  def bold
    fancy(1,22)
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end

  def magenta
    colorize(35)
  end

end
