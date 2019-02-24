defmodule Triple do
    def pythagorean(n) when n>0 do
        for a <- 1..n,
            b <- a..n,
            c <- a..n,
#            a <= b,
#            a+b > c,
            a*a+b*b == c*c,
            do: {a,b,c}
    end
end