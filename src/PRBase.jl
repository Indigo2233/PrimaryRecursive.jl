succ(xs...) = xs[1] + 1

zro(xs...) = 0

abstract type AbstractOprator end

struct Proj{T} <: AbstractOprator end

function (::Proj{T})(xs...) where {T}
    return xs[T]
end

struct Comb <: AbstractOprator 
    f::Union{Function,AbstractOprator}
    gs::Tuple{Vararg{T where T<:Union{Function,AbstractOprator}}}
    Comb(f, gs...) = new(f, gs)
end

function (c::Comb)(xs...)
    return c.f((g(xs...) for g in c.gs)...)
end

struct PrimRec <: AbstractOprator
    basic::Union{Function,AbstractOprator}
    step::Union{Function,AbstractOprator}
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
