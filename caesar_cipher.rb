# Encrypts a phrase or word with Caesar Cipher
class CaesarCipher
  def encrypt_word(string, key = 0, shift = "right")
    string.split.map do |word|
      word.chars.map do |letter|
        # Only apply encryption if the character is a letter
        case letter
        when "a".."z"
          encrypt_letter(letter, key, false, shift)
        when "A".."Z"
          encrypt_letter(letter, key, true, shift)
        else
          letter
        end
      end.join
    end.join(" ")
  end

  private

  def encrypt_letter(letter, key, is_upper_case, shift = "right")
    normalise = is_upper_case ? "A" : "a"
    case shift
    when "right"
      (((letter.ord - normalise.ord + key) % 26) + normalise.ord).chr
    when "left"
      (((letter.ord - normalise.ord - key) % 26) + normalise.ord).chr
    end
  end
end

cipher = CaesarCipher.new
puts cipher.encrypt_word("What a string!", 5)
