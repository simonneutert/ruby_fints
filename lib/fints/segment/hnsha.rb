module FinTS
  module Segment
    # HNSHA (Signaturabschluss)
    # Section B.5.2
    class HNSHA < BaseSegment
      SECURITY_FUNC = 999
      SECURITY_BOUNDARY = 1  # SHM
      SECURITY_SUPPLIER_ROLE = 1  # ISS
      PINTAN_VERSION = 1  # 1-step

      def initialize(segno, secref, pin)
        @type = 'HNSHA'
        @version = 2
        data = [secref, '', Helper.fints_escape(pin)]
        super(segno, data)
      end

    end
  end
end
