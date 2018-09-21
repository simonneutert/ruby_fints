module FinTS
  module Segment
    # HKKAZ (Kontoumsätze)
    # Refs: http://www.hbci-zka.de/dokumente/spezifikation_deutsch/fintsv3/FinTS_3.0_Messages_Geschaeftsvorfaelle_2015-08-07_final_version.pdf
    # Section C.2.1.1.1.2
    class HKKAZ < BaseSegment
      attr_reader :type
      attr_reader :version

      def initialize(segno, version, account, date_start, date_end, touchdown)
        @type = 'HKKAZ'
        @version = version
        data = [
          account,
          'N',
          date_start.strftime('%Y%m%d'),
          date_end.strftime('%Y%m%d'),
          '',
          touchdown ? FinTS::Helper.fints_escape(touchdown) : ''
        ]
        super(segno, data)
      end

    end
  end
end
