module FinTS
  module Segment
    # HKVVB (Verarbeitungsvorbereitung)
    # Section C.3.1.3
    class HKVVB < BaseSegment
      LANG_DE = 1
      LANG_EN = 2
      LANG_FR = 3

      attr_reader :type
      attr_reader :version

      def initialize(segment_no, lang: LANG_DE)
        @type = 'HKVVB'
        @version = 3
        data = [
          0, 0, lang,
          Helper.fints_escape(FinTS::GEM_NAME),
          Helper.fints_escape(FinTS::VERSION)
        ]
        super(segment_no, data)
      end

    end
  end
end
