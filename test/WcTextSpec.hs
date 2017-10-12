module WcTextSpec(spec) where

import Test.Hspec

import qualified WcText;

spec :: Spec
spec = describe "WcText" $ do
  describe "New API" $ do
    describe "getLineCount returns a WcResult with count of lines" $ do
      it "should return 1 for one line" $ do
        WcText.getLineCount "line1" `shouldBe` WcText.WcSingleCount 1
      it "should return 3 for three lines" $ do
        WcText.getLineCount "line1\nline2\nline3" `shouldBe` WcText.WcSingleCount 3
    describe "getWordCount returns number of words" $ do
      it "should return 1 for a line with a single word" $ do
        WcText.getWordCount "word" `shouldBe` WcText.WcSingleCount 1
      it "should return 3 for a line with three words" $ do
        WcText.getWordCount "word1 word2 word3" `shouldBe` WcText.WcSingleCount 3
      it "should return 5 for 2 lines with five words and some other whitespace" $ do
        WcText.getWordCount "word1   word2\tword3\nword4    word5  " `shouldBe` WcText.WcSingleCount  5
    describe "getByteCount returns number of bytes" $ do
      it "should return 1 for a string with one character" $ do
        WcText.getByteCount "a" `shouldBe` WcText.WcSingleCount 1
      it "should return 5 for a string with five characters" $ do
        WcText.getByteCount "abcde" `shouldBe` WcText.WcSingleCount 5
      it "should count new-lines" $do
        WcText.getByteCount "ab\ncde" `shouldBe` WcText.WcSingleCount 6

    describe "getAllCounts returns lines, words and bytes" $ do
      it "returns lines words and bytes for a given string" $ do
        WcText.getAllCounts "line1\nline2 word" `shouldBe` WcText.WcAllCounts 2 3 16

    describe "WcResult Show instance" $ do
      it "shows a WcSingleCount as the string of its count" $ do
        (show $ WcText.WcSingleCount 1234) `shouldBe` "1234"
      it "shows a WcAllCounts as the combined string of all counts" $ do
        (show $ WcText.WcAllCounts 4 7 47) `shouldBe` " 4  7 47"
