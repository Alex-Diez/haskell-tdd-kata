module CalculatorKata.Day9 (calculate) where

    calculate :: String -> Double
    calculate src = calculate' src ""
        where
            calculate' :: String -> String -> Double
            calculate' "" num = read num
            calculate' (c:src) num  | c == '+'  = read num + calculate' src ""
                                    | c == '-'  = read num - calculate' src ""
                                    | c == '*'  = read num * calculate' src ""
                                    | c == '/'  = read num / calculate' src ""
                                    | otherwise = calculate' src (num ++ [c])
