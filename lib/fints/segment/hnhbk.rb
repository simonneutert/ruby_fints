module FinTS
  module Segment
    # HNHBK (Nachrichtenkopf)
    # Section B.5.2
    class HNHBK < BaseSegment
      HEADER_LENGTH = 29

      attr_reader :type
      attr_reader :version

      def initialize(msglen, dialog_id, msg_no)
        @type = 'HNHBK'
        @version = 3
        if msglen.to_s.length != 12
          msglen = (msglen.to_i + HEADER_LENGTH + dialog_id.to_s.length + msg_no.to_s.length).to_s.rjust(12, '0')
        end
        data = [msglen, 300, dialog_id, msg_no]
        super(1, data)
      end

    end
  end
end
