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

  def hash_key(s)
    return symbol(s) if symbol?(s)
    string(s)
  end

  def hash_value(s)
    return integer(s) if integer?(s)
    return float(s)   if float?(s)
    return symbol(s)  if symbol?(s)
    string(s)
  end

  def symbol?(s)
    s =~ /^:/
  end

  def symbol_string(s)
    str = s
    str = s[1..-1] if symbol?(s)
    str = string(str) if string?(str)
    str
  end

  def symbol(s)
    symbol_string(s).to_sym
  end

  def string?(s)
    s =~ /^".*"$/
  end

  def string(s)
    return s[1..-2] if string?(s)
    return s
  end

  def integer?(s)
    s =~ /^[1-9|\-]+[0-9]*$/
  end

  def float?(s)
    s =~ /^[1-9|\-]+[0-9|\.]*$/
  end

  def integer(s)
    s.to_i
  end

  def float(s)
    s.to_f
  end
end
