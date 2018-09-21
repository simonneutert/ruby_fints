module FinTS
  module Segment
    # HNHBS (Nachrichtenabschluss)
    # Section B.5.3
    class HNHBS < BaseSegment

      def initialize(segno, msgno)
        @type = 'HNHBS'
        @version = 1
        data = [msgno.to_s]
        super(segno, data)
      end

    end
  end
end
