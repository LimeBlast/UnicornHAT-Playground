# http://tnux.net/blog/2011/10/26/gradient-calculation-in-ruby/
class Gradient
  attr_accessor :resolution, :r0, :g0, :b0, :r1, :g1, :b1

  def initialize(start, stop, resolution)
    @resolution = Float(resolution)

    @r0 = start[0]
    @g0 = start[1]
    @b0 = start[2]

    @r1 = stop[0]
    @g1 = stop[1]
    @b1 = stop[2]
  end

  def gradient(step)
    r = interpolate(@r0, @r1, step)
    g = interpolate(@g0, @g1, step)
    b = interpolate(@b0, @b1, step)

    (((r << 8) | g) << 8) | b
  end

  def interpolate(start, stop, step)
    if start < stop
      (((stop - start) * (step / @resolution)) + start).round
    else
      (((start - stop) * (1 - (step / @resolution))) + stop).round
    end
  end
end
