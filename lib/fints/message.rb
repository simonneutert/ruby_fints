module FinTS
  class Message
    attr_accessor :msg_no
    attr_accessor :dialog_id
    attr_accessor :encrypted_segments

    def initialize(blz, username, pin, dialog, encrypted_segments)
      @blz = blz
      @username = username
      @pin = pin
      @system_id = dialog.system_id
      @dialog_id = dialog.dialog_id
      @msg_no = dialog.msg_no
      @segments = []
      @encrypted_segments = []
      @tan_mechs = dialog.tan_mechs

      set_profile_and_security
      encode_segments(encrypted_segments)
    end

    def set_profile_and_security
      if @tan_mechs && !@tan_mechs.include?('999')
        @profile_version = 2
        @security_function = @tan_mechs[0]
      else
        @profile_version = 1
        @security_function = '999'
      end
    end

    def encode_segments(encrypted_segments)
      # init enc_envelop
      @enc_envelop = Segment::HNVSD.new(999, '')
      # build heads
      sig_head = build_signature_head
      enc_head = build_encryption_head
      # build start of segment
      @segments << enc_head
      @segments << @enc_envelop
      append_enc_segment(sig_head)
      # build encrypted_segments of segment
      encrypted_segments.each { |segment| append_enc_segment(segment) }
      # build of segment
      cur_count = encrypted_segments.length + 3
      sig_end = Segment::HNSHA.new(cur_count, @secref, @pin)
      append_enc_segment(sig_end)
      @segments << Segment::HNHBS.new(cur_count + 1, msg_no)
    end

    def append_enc_segment(seg)
      @encrypted_segments << seg
      @enc_envelop.set_data(@enc_envelop.encoded_data + seg.to_s)
    end

    def build_signature_head
      @secref = Kernel.rand(1000000..9999999)
      Segment::HNSHK.new(2, @secref, @blz, @username, @system_id, @profile_version, @security_function)
    end

    def build_encryption_head
      Segment::HNVSK.new(998, @blz, @username, @system_id, @profile_version)
    end

    def build_header
      length = @segments.map(&:to_s).inject(0) { |sum, segment| sum + segment.length }
      Segment::HNHBK.new(length, @dialog_id, @msg_no)
    end

    def to_s
      build_header.to_s + @segments.map(&:to_s).join('')
    end
  end
end
