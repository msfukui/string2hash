class String
  def to_h
    return {} unless hash_string_format_valid(self)
    s = strip.match(/\{([^\{]*?)\}/)[1]
    hash_string_convert_to_hash(s)
  end

  private

  def hash_string_format_valid(s)
    return false if s.empty?
    return false if s.strip.match(/\{([^\{]*?)\}/).nil?
    return false if s.strip.match(/\{([^\{]*?)\}/)[1].empty?
    true
  end

  def hash_string_convert_to_hash(s)
    r = {}
    s.strip.split(',').each do |item|
      (key, value) = item.strip.split('=>')
      r[hash_string_hash_key(key.strip)] = hash_string_hash_value(value.strip)
    end
    r
  end

  def hash_string_hash_key(s)
    return s[1..-1].to_sym if s =~ /^:/
    return s[1..-1].slice(-1) if s =~ /^".*"$/
    s
  end

  def hash_string_hash_value(s)
    return s[1..-2] if s =~ /^".*"$/
    s.to_i
  end
end
