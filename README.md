# String2Hash

This class extends Ruby 's String class and provides the ability to convert Ruby' s Hash string to Hash.

## Usage

```sh
$ cat h2j
#!/usr/bin/env ruby

require 'string2hash'
require 'json'

puts JSON.pretty_generate(STDIN.read.to_h)
$ echo '{:a=>1, :b=>"c"}' | h2j
{
  "a": 1,
  "b": "c"
}
```

## My Hash String definition

* The character constains of only displayable not including the control code.

* Hash character string is a character string composed of a list of Hash elements enclosed by "{}".

* The Hash character string is enclosed in "{}", but allows for white space before and after.

* Hash elements are separated by "," and a character string consisting of whitespace.

* A single Hash element consists of a list of key and value pairs.

* Between key and value are separated by '=>'.

* Key is represented by a character string enclosed in a character string (Symbol) or "" beginning with ':'.

* Value is represented by a character string enclosed in a numeric string (numerical value) or "" which is not enclosed with a Hash character string or "".
