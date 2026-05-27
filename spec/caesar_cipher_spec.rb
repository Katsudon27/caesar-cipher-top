require_relative "../caesar_cipher"

describe CaesarCipher do
  # Query Method -> Test the return value
  describe "#encrypt_string" do
    subject(:cipher) { described_class.new }
    context "when encrypting a phrase" do
      let(:string) { "What a string" }

      it "works with a small shift to the right" do
        small_right_shift = 5
        result = cipher.encrypt_string(string, small_right_shift)
        expect(result).to eql("Bmfy f xywnsl")
      end

      it "works with a small shift to the left" do
        small_left_shift = 5
        result = cipher.encrypt_string(string, small_left_shift, "left")
        expect(result).to eql("Rcvo v nomdib")
      end

      it "works with a large shift to the right" do
        large_right_shift = 55
        result = cipher.encrypt_string(string, large_right_shift)
        expect(result).to eql("Zkdw d vwulqj")
      end

      it "works with a large shift to the left" do
        large_left_shift = 55
        result = cipher.encrypt_string(string, large_left_shift, "left")
        expect(result).to eql("Texq x pqofkd")
      end
    end

    context "when translating a string with punctuation" do
      let(:punctuation_string) { "What, a, string!" }

      it "does not translate the punctuation" do
        shift = 5
        result = cipher.encrypt_string(punctuation_string, shift)
        expect(result).to eql("Bmfy, f, xywnsl!")
      end
    end
  end
end
