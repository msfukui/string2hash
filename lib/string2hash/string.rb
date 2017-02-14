class String
  def to_h
    r = {}

    return r if empty?

    s = match(/\{([^\{]*?)\}/)[1]

    return r if s.empty?

    s.strip.split(',').each do |item|
      (key, value) = item.strip.split('=>')

      r[hash_key(key)] = hash_value(value)
    end

    r
  end

  private

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
