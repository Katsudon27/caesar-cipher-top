def caesar_cipher(string, key = 0, shift = "right")
  # First, we split the provided string into an array with individual words
  words = string.split

  # Map is used here to return a new array of encrypted words
  encrypted_string = words.map do |word|
    # We then use split to turn each word into an array with individual letters
    # and use reduce to create a new word with encrypted letters
    word.chars.reduce("") do |encrypted_word, letter|
      # Only apply encryption if the character is a letter
      if letter.match?(/[A-Za-z]/)
        # Different calculations for shifting and wrapping of letters
        # depending on shift direction
        case shift
        when "right"
          letter_code = letter.ord + key
          if letter_code > 90 && letter_code < 97
            letter_code = 64 + (letter_code - 90)
          elsif letter_code > 122
            letter_code = 96 + (letter_code - 122)
          end
        when "left"
          letter_code = letter.ord - key
          if letter_code < 65
            letter_code = 91 - (65 - letter_code)
          elsif letter_code < 97 && letter_code > 91
            letter_code = 123 - (97 - letter_code)
          end
        end

        # Convert the letter back to its string form
        letter = letter_code.chr
      end
      # Append it to form the encrypted word
      encrypted_word + letter
    end
  end
  puts encrypted_string.join(" ")
end

caesar_cipher("What a string!", 5, "left")
