# caesar-cipher-top

This is a function that encrypts a given string with Caesar Cipher based on the provided shift factor and direction.

## Usage instruction
```ruby
cipher.encrypt_word(<string>, <shift factor>, <optional: shift direction>)
```

Example:

```ruby
cipher = CaesarCipher.new
puts cipher.encrypt_string("What a string!", 5)
```
