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
