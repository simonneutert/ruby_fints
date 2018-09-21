module FinTS
  module Segment
    # HKIDN (Identifikation)
    # Section C.3.1.2
    class HKIDN < BaseSegment
      
      def initialize(segment_number, blz, username, system_id=0, customerid=1)
        @type = 'HKIDN'
        @version = 2
        data = ["#{country_code}:#{blz}", FinTS::Helper.fints_escape(username), system_id, customerid]
        super(segment_number, data)
      end

    end
  end
end
