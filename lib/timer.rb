class Timer
  attr_accessor :stopped_time, :hours, :minutes, :seconds

  def initialize(window)
    @hours = 0
    @minutes = 0
    @seconds = 0
    @last_time = Gosu.milliseconds
    @font = Gosu::Font.new(window, Gosu.default_font_name, 26)
    @stopped_time = ""
  end

  def update
    if (Gosu.milliseconds - @last_time) / 1000 == 1
      @last_time = Gosu.milliseconds
      @seconds += 1
    end
    if @seconds > 59
      @seconds = 0
      @minutes += 1
    end
    if @minutes > 59
      @minutes = 0
      @hours += 1
    end
  end
  
  def draw(x, y)
    @font.draw("Elapsed Time: #{formatted}",x, y, 3, 1.0, 1.0, 0xff6F0000)
  end
  
  def formatted
    "#{@hours}".rjust(2, '0') + ":" + "#{@minutes}".rjust(2, '0') + ":" + "#{@seconds}".rjust(2, '0')
  end
  
  def reset!
    @stopped_time = formatted
    @hours = @minutes = @seconds = 0
    @last_time = Gosu.milliseconds
  end
  
end