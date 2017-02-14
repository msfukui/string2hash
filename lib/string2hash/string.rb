class String
  def to_h
    return {} if strip.empty?

    match_data = match(/\{([^\{]*?)\}/)

    return {} if match_data.nil?

    s = match_data[1]

    return {} if s.empty?

    convert_to_hash(s)
  end

  private

  def convert_to_hash(s)
    r = {}
    s.strip.split(',').each do |item|
      (key, value) = item.strip.split('=>')
      r[hash_key(key)] = hash_value(value)
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
