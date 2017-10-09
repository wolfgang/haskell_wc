module WcArgsSpec(spec) where

import Test.Hspec

import qualified WcArgs

spec :: Spec
spec = describe "WcArgs" $ do
  it "should return second argument as file name" $ do
    let args = ["lala", "file name", "blah"]
    (WcArgs.getFileName args) `shouldBe` "file name"

  it "should return first argument as action" $ do
    WcArgs.getAction ["-l", "file name"] `shouldBe` WcArgs.CountLines
