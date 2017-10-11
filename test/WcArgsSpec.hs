module WcArgsSpec(spec) where

import Test.Hspec

import qualified WcArgs

spec :: Spec
spec = describe "WcArgs" $ do
  it "should return second argument as file name" $ do
    let args = ["lala", "file name", "blah"]
    (WcArgs.getFileName args) `shouldBe` "file name"

  it "should return first argument -l as action CountLines" $ do
    WcArgs.getAction ["-l", "file name"] `shouldBe` WcArgs.CountLines

  it "should return first argument -w as action CountWords" $ do
    WcArgs.getAction ["-w", "file name"] `shouldBe` WcArgs.CountWords

  it "should return first argument -c as action CountBytes" $ do
    WcArgs.getAction ["-c", "file name"] `shouldBe` WcArgs.CountBytes

  it "should return unknown first argument as action InvalidOption" $ do
    WcArgs.getAction ["-x", "file name"] `shouldBe` WcArgs.InvalidOption "x"
