module PrimaryRecursive

# Write your package code here.
include("PRBase.jl")
include("arithmetic.jl")

export p1, p2, p3, PrimRec, succ, zro, Comb, Proj,
    add, mult, pred, cosub, dff, sgn, nsgn, const1, remainder, ge,
    ifel, square, floor_sqrt, traingle, pair, fib, fst, scd
end
