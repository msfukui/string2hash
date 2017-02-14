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
