class BaseSegment
  attr_accessor :segmentno
  attr_reader :type
  attr_reader :version

  def initialize(segmentno, data)
    @segmentno = segmentno
    @data = data
  end

  def to_s
    res = [@type, @segmentno, @version].join(':')
    @data.each do |d|
      res << "+#{d}"
    end
    res << "'"
    res
  end

  def country_code
    280
  end
end
