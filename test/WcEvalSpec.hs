module WcEvalSpec(spec) where

import Test.Hspec

getLineCount :: String -> Int
getLineCount text = length $ lines text

spec :: Spec
spec = describe "WcEval" $ do
  describe "getLineCount returns number of lines" $ do
    it "should return 1 for one line" $ do
      getLineCount "line1" `shouldBe` 1
    it "should return 3 for three lines" $ do
      getLineCount "line1\nline2\nline3" `shouldBe` 3
