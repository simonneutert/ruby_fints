module FinTS
  module Segment
    # HKSPA (SEPA-Kontoverbindung anfordern)
    # Section C.10.1.3
    class HKSPA < BaseSegment

      def initialize(segno, accno, subaccfeature, blz)
        @type = 'HKSPA'
        @version = 1
        data = if accno.nil?
                  ['']
                else
                  [[accno, subaccfeature, country_code, blz].join(':')]
                end
        super(segno, data)
      end

    end
  end
end
