module WcSpec(spec) where

import Test.Hspec

spec :: Spec
spec = describe "Word Count" $ do
  it "should fail" $do
    1 `shouldBe` 1
