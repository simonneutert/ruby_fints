module FinTS
  module Segment
    # HKSYN (Synchronisation)
    # Section C.8.1.2
    class HKSYN < BaseSegment
      SYNC_MODE_NEW_CUSTOMER_ID = 0
      SYNC_MODE_LAST_MSG_NUMBER = 1
      SYNC_MODE_SIGNATURE_ID = 2

      def initialize(segment_no, mode: SYNC_MODE_NEW_CUSTOMER_ID)
        @type = 'HKSYN'
        @version = 3
        data = [mode]
        super(segment_no, data)
      end

    end
  end
end
