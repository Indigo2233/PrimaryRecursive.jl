abstract type AbstractPrimRec end

struct Succ <: AbstractPrimRec end

(::Succ)(xs::Int...)::Int = xs[1] + 1

const succ = Succ()

struct Zero <: AbstractPrimRec end

(::Zero)(xs::Int...)::Int = 0

const zro = Zero()

struct Proj{T} <: AbstractPrimRec end

function (::Proj{T})(xs::Int...)::Int where {T}; xs[T] end

struct Comb <: AbstractPrimRec
    f::AbstractPrimRec
    gs::Tuple{Vararg{T where T<:AbstractPrimRec}}
    Comb(f, gs...) = new(f, gs)
end

(c::Comb)(xs::Int...)::Int = c.f((g(xs...) for g in c.gs)...)

struct PrimRec <: AbstractPrimRec
    basic::AbstractPrimRec
    step::AbstractPrimRec
end

(pr::PrimRec)(xs::Int...)::Int = begin
    t = xs[1]
    y = xs[2:end]
    cur = pr.basic(y...)
    for i in 0:(t - 1)
        cur = pr.step(cur, i, y...)
    end
    cur
end

(f::AbstractPrimRec)(gs::AbstractPrimRec...) = Comb(f, gs...)
