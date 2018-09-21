module FinTS
  module Segment
    # HKEND (Dialogende)
    # Section C.4.1.2
    class HKEND < BaseSegment
      attr_reader :type
      attr_reader :version

      def initialize(segno, dialog_id)
        @type = 'HKEND'
        @version = 1
        data = [dialog_id]
        super(segno, data)
      end

    end
  end
end
