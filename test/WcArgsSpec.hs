module WcArgsSpec(spec) where

import Test.Hspec

getFileName :: [String] -> String
getFileName args = args!!1

spec :: Spec
spec = describe "WcArgs" $ do
  it "should return second argument as file name" $ do
    let args = ["lala", "file name", "blah"]
    (getFileName args) `shouldBe` "file name"
