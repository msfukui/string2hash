# String2Hash

This class converts Ruby's Hash String to Ruby's Hash.

## Usage

```ruby
$ cat h2j
require 'string2hash'
require 'json'
puts JSON.pretty_generate(STDIN.read.to_h)
$ echo '{:a=>1, :b=>"c"}' | h2j
{
  "a": 1,
  "b": "c"
}
```
