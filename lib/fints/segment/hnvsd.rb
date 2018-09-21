module FinTS
  module Segment
    # HNVSD (Verschlüsselte Daten)
    # Section B.5.4
    class HNVSD < BaseSegment
      attr_reader :encoded_data
      attr_reader :type
      attr_reader :version

      def initialize(segno, encoded_data)
        @type = 'HNVSD'
        @version = 1
        @encoded_data = encoded_data
        data = ["@#{encoded_data.length}@#{encoded_data}"]
        super(segno, data)
      end

      def set_data(encoded_data)
        @encoded_data = encoded_data
        @data = ["@#{encoded_data.length}@#{encoded_data}"]
      end

    end
  end
end
