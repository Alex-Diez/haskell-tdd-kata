module RomanNumbersKata.Day2 (toRomanNumber) where

    toRomanNumber :: Int -> String
    toRomanNumber num = hundreds' num
        where
            hundreds' :: Int -> String
            hundreds' num =
                let hundreds    = div num 100
                    rest        = mod num 100
                in case hundreds of
                    0 -> fifties' rest
                    _ -> 'C':(fifties' rest)
            fifties' :: Int -> String
            fifties' num =
                let fifties = div num 50
                    rest    = mod num 50
                in case fifties of
                    0 -> tens' rest
                    _ -> 'L':(tens' rest)
            tens' :: Int -> String
            tens' num =
                let tens    = div num 10
                    rest    = mod num 10
                in case tens of
                    0 -> fives' num
                    4 -> 'X':'L':(fives' rest)
                    _ -> 'X':(fives' rest)

            fives' :: Int -> String
            fives' num
                | num == 9  = "IX"
                | otherwise =
                    let fives   = div num 5
                        rest    = mod num 5
                    in case fives of
                        0 -> ones' rest
                        _ -> 'V':(ones' rest)

            ones' :: Int -> String
            ones' ones =
                case ones of
                    4 -> "IV"
                    _ -> replicate ones 'I'
