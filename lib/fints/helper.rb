module FinTS
  class Helper

    def self.fints_escape(content)
      content.gsub('?', '??').gsub('+', '?+').gsub(':', '?:').gsub("'", "?'")
    end

    def self.fints_unescape(content)
      content.gsub('??', '?').gsub("?'", "'").gsub('?+', '+').gsub('?:', ':')
    end

    def self.mt940_to_array(data)
      processed_data = data.gsub('@@', "\n").gsub('-0000', '+0000')
      mt940 = Cmxl.parse(processed_data)
      mt940.flat_map(&:transactions)
    end

    def self.split_for_data_groups(seg)
      seg.split(/\+(?<!\?\+)/)
    end

    def self.split_for_data_elements(deg)
      deg.split(/:(?<!\?:)/)
    end

    def self.build_message(account, hversion)
      if [4, 5, 6].include?(hversion)
        "#{account[:accountnumber]}:#{account[:subaccount]}:280:#{account[:blz]}"
      elsif hversion == 7
        "#{account[:iban]}:#{account[:bic]}:#{account[:accountnumber]}:#{account[:subaccount]}:280:#{account[:blz]}"
      else
        raise ArgumentError, "Unsupported HKSAL version #{hversion}"
      end
    end

  end
end
