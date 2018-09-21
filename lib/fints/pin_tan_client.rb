module FinTS
  class PinTanClient < Client
    def initialize(blz, username, pin, server)
      @blz = blz
      @username = username
      @pin = pin
      @connection = HTTPSConnection.new(server)
      @system_id = 0
      super()
    end
  end
end
