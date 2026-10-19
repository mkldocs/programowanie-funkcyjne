expApprox :: Int -> Double -> Double
expApprox n x = expApprox_hlp n 0 x 1 1

expApprox_hlp n k x s a =
    if k == n then s
    else
        let
            k_s = k + 1
            a_s = a * x / fromIntegral k_s
        in
            expApprox_hlp n k_s x (s + a_s) a_s

expApproxEps :: Double -> Double -> Double
expApproxEps eps x = expApproxEps_hlp eps 0 x 1 1

expApproxEps_hlp eps k x s a =
    if a < eps then s
    else
        let
            k_s = k + 1
            a_s = a * x / fromIntegral k_s
        in
            expApproxEps_hlp eps k_s x (s + a_s) a_s


trapezoidal :: (Double -> Double) -> (Double, Double) -> Int -> Double
trapezoidal f (a, b) n =
    let
        h = (b - a) / fromIntegral n
    in
        h * ((f a + f b) / 2 + t_sum 0 (n - 1) 0 f a h)

t_sum :: Int -> Int -> Double -> (Double -> Double) -> Double -> Double -> Double
t_sum i n s f a h =
    if i == n then s
    else
        t_sum (i + 1) n (s + f (a + fromIntegral (i + 1) * h)) f a h