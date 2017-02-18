class String
  def to_h
    return {} unless valid_hash_string(self)
    s = pick_out_hash_element(self)
    convert_string_to_hash(s)
  end

  private

  def valid_hash_string(s)
    s.strip!
    return false if s.empty?
    return false if s.match(/^\{.*\}$/).nil?
    true
  end

  def pick_out_hash_element(s)
    return s.strip.slice(1..-2).strip unless s.strip.match(/^\{.*\}$/).nil?
    s
  end

  def convert_string_to_hash(s)
    r = {}
    s.strip.split(',').each do |item|
      (key, value) = item.strip.split('=>')
      r[hash_key(key.strip)] = hash_value(value.strip)
    end
    r
  end

  def hash_key(s)
    return s[1..-1].to_sym if s =~ /^:/
    return s[1..-1].slice(-1) if s =~ /^".*"$/
    s
  end

  def hash_value(s)
    return s[1..-2] if s =~ /^".*"$/
    s.to_i
  end
end
