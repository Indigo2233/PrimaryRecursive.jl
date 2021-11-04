abstract type AbstractPrimRec end

struct Succ <: AbstractPrimRec end

(::Succ)(xs...) = xs[1] + 1

succ = Succ()

struct Zero <: AbstractPrimRec end

(::Zero)(xs...) = 0

zro = Zero()

struct Proj{T} <: AbstractPrimRec end

(::Proj{T})(xs...) where {T} = xs[T]

struct Comb <: AbstractPrimRec
    f::AbstractPrimRec
    gs::Tuple{Vararg{T where T<:AbstractPrimRec}}
    Comb(f, gs...) = new(f, gs)
end

(c::Comb)(xs...) = c.f((g(xs...) for g in c.gs)...)

struct PrimRec <: AbstractPrimRec
    basic::AbstractPrimRec
    step::AbstractPrimRec
end

(pr::PrimRec)(xs...) = begin
    t = xs[1]
    y = xs[2:end]
    cur = pr.basic(y...)
    for i in 0:(t - 1)
        cur = pr.step(cur, i, y...)
    end
    cur
end
