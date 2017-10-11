module WcTextSpec(spec) where

import Test.Hspec

import qualified WcText;

spec :: Spec
spec = describe "WcText" $ do
  describe "getLineCount returns number of lines" $ do
    it "should return 1 for one line" $ do
      WcText.getLineCount "line1" `shouldBe` 1
    it "should return 3 for three lines" $ do
      WcText.getLineCount "line1\nline2\nline3" `shouldBe` 3
  describe "getWordCount returns number of words" $ do
    it "should return 1 for a line with a single word" $ do
      WcText.getWordCount "word" `shouldBe` 1
    it "should return 3 for a line with three words" $ do
      WcText.getWordCount "word1 word2 word3" `shouldBe` 3
    it "should return 5 for 2 lines with five words and some other whitespace" $ do
      WcText.getWordCount "word1   word2\tword3\nword4    word5  " `shouldBe` 5
  describe "getByteCount returns number of bytes" $ do
    it "should return 1 for a string with one character" $ do
      WcText.getByteCount "a" `shouldBe` 1
    it "should return 5 for a string with five characters" $ do
      WcText.getByteCount "abcde" `shouldBe` 5
    it "should count new-lines" $do
      WcText.getByteCount "ab\ncde" `shouldBe` 6
