module SubListKata.Day7Spec (spec) where

    import Test.Hspec
    import SubListKata.Day7 (sublist, Result(..))

    spec :: Spec
    spec = do
        it "emtpy equals empty" $ do
            sublist "" "" `shouldBe` Equal

        it "empty is sublist of anything" $ do
            sublist "" "anyhting" `shouldBe` Sublist

        it "anything is superlist of empty" $ do
            sublist "anything" "" `shouldBe` Superlist

        it "1 does not equal 2" $ do
            sublist "1" "2" `shouldBe` Unequal

        it "100 equals 100" $ do
            sublist "100" "100" `shouldBe` Equal

        it "11 is sublist of 221133" $ do
            sublist "11" "221133" `shouldBe` Sublist

        it "221133 is superlist of 11" $ do
            sublist "221133" "11" `shouldBe` Superlist
