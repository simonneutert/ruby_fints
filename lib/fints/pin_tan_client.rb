module FinTS
  class PinTanClient < Client

    def initialize(blz, username, pin, server)
      # user data
      @blz = blz
      @username = username
      @pin = pin
      # client defaults
      @connection = HTTPSConnection.new(server)
      @system_id = 0
      super()
    end

  end
end
