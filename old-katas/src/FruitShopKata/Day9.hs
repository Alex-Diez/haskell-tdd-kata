module FruitShopKata.Day9 (process) where

    type Bill       = (Money, [Product])
    type Product    = String
    type Money      = Int

    process :: [Product] -> [Money]
    process = map fst . tail . scanl addProduct (0, [])
        where
            addProduct :: Bill -> Product -> Bill
            addProduct (total, products) product = (total + findPrice product - discount product, product:products)
                where
                    findPrice :: Product -> Money
                    findPrice p
                        | p == "Pommes" = 100
                        | p == "Bananes" = 150
                        | p == "Cerises" = 75

                    discount :: Product -> Money
                    discount p = case lookup p specials of
                        Just (discount, m)  -> ((applyDiscount discount) . (==0) . (`mod` m) . length . filter ((==) p)) (p:products)
                        Nothing             -> 0

                    applyDiscount :: Money -> Bool -> Money
                    applyDiscount discount True = discount
                    applyDiscount _ _           = 0

                    specials = [("Bananes", (150, 2)), ("Cerises", (20, 2))]
