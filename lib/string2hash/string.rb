class String
  def to_h
    convert_string_to_hash(self)
  end

  private

  def convert_string_to_hash(s)
    return {} if hash_string_invalid?(s)

    r = {}
    hash_elements = pick_out_hash_elements(s)
    hash_elements.each_with_index do |item, i|
      if include_hash_string?(item)
        (key, value) = pick_out_key_value(hash_elements[i..-1].join(', '))
        r[hash_key(key)] = convert_string_to_hash(value)
        break
      else
        (key, value) = pick_out_key_value(item)
        r[hash_key(key)] = hash_value(value)
      end
    end
    r
  end

  def hash_string_invalid?(s)
    !hash_string_valid?(s)
  end

  def hash_string_valid?(s)
    s.strip!
    return false if s.empty?
    return false unless s =~ /^\{.*\}$/
    return false unless s.count('{') == s.count('}')
    true
  end

  def pick_out_hash_elements(s)
    s.strip!
    if s =~ /^\{.*\}$/
      elements = s[1..-2] if s =~ /^\{.*\}$/
    else
      elements = s
    end
    elements.split(/,(?!")/).map(&:strip)
  end

  def include_hash_string?(s)
    s =~ /\{/
  end

  def pick_out_key_value(s)
    s.split('=>', 2).map(&:strip)
  end

  def hash_key(key)
    return key[1..-1].to_sym if key =~ /^:/
    return key[1..-1].slice(-1) if key =~ /^".*"$/
    s
  end

  def hash_value(value)
    return value[1..-2] if value =~ /^".*"$/
    value.to_i
  end
end
