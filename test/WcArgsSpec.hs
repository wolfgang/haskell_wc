module WcArgsSpec(spec) where

import Test.Hspec

spec :: Spec
spec = describe "WcArgs" $ do
  it "should fail" $ do
    1 `shouldBe` 1
