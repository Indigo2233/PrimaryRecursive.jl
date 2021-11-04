abstract type AbstractPrimRec end

struct Succ <: AbstractPrimRec end

(::Succ)(xs...) = xs[1] + 1

succ = Succ()

struct Zero <: AbstractPrimRec end

(::Zero)(xs...) = 0

zro = Zero()

struct Proj{T} <: AbstractPrimRec end

function (::Proj{T})(xs...) where {T}
    return xs[T]
end

struct Comb <: AbstractPrimRec
    f::AbstractPrimRec
    gs::Tuple{Vararg{T where T<:AbstractPrimRec}}
    Comb(f, gs...) = new(f, gs)
end

function (c::Comb)(xs...)
    return c.f((g(xs...) for g in c.gs)...)
end

struct PrimRec <: AbstractPrimRec
    basic::AbstractPrimRec
    step::AbstractPrimRec
end

function (pr::PrimRec)(xs...)
    t = xs[1]
    y = xs[2:end]
    cur = pr.basic(y...)
    for i in 0:(t - 1)
        cur = pr.step(cur, i, y...)
    end
    return cur
end
