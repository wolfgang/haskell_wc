module WcTextSpec(spec) where

import Test.Hspec

import qualified WcText;

spec :: Spec
spec = describe "WcText" $ do
  describe "Legacy API" $ do
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
  describe "New API" $ do
    describe "getLineCountNew returns a WcResult with count of lines" $ do
      it "should return 1 for one line" $ do
        WcText.getLineCountNew "line1" `shouldBe` WcText.WcLineCount 1
      it "should return 3 for three lines" $ do
        WcText.getLineCountNew "line1\nline2\nline3" `shouldBe` WcText.WcLineCount 3
    describe "getWordCountNew returns number of words" $ do
      it "should return 1 for a line with a single word" $ do
        WcText.getWordCountNew "word" `shouldBe` WcText.WcWordCount 1
      it "should return 3 for a line with three words" $ do
        WcText.getWordCountNew "word1 word2 word3" `shouldBe` WcText.WcWordCount 3
      it "should return 5 for 2 lines with five words and some other whitespace" $ do
        WcText.getWordCountNew "word1   word2\tword3\nword4    word5  " `shouldBe` WcText.WcWordCount  5
    describe "getByteCountNew returns number of bytes" $ do
      it "should return 1 for a string with one character" $ do
        WcText.getByteCountNew "a" `shouldBe` WcText.WcByteCount 1
      it "should return 5 for a string with five characters" $ do
        WcText.getByteCountNew "abcde" `shouldBe` WcText.WcByteCount 5
      it "should count new-lines" $do
        WcText.getByteCountNew "ab\ncde" `shouldBe` WcText.WcByteCount 6

    describe "getAllCounts returns lines, words and bytes" $ do
      it "returns lines words and bytes for a given string" $ do
        WcText.getAllCounts "line1\nline2 word" `shouldBe` WcText.WcAllCounts 2 3 16

    describe "WcResult Show instance" $ do
      it "shows a WcLineCount as the string of its count" $ do
        (show $ WcText.WcLineCount 1234) `shouldBe` "1234"
      it "shows a WcWordCount as the string of its count" $ do
        (show $ WcText.WcWordCount 1234) `shouldBe` "1234"
      it "shows a WcAllCounts as the combined string of all counts" $ do
        (show $ WcText.WcAllCounts 4 7 47) `shouldBe` " 4  7 47"
