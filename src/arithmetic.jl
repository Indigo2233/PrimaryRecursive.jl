const p1 = Proj{1}()
const p2 = Proj{2}()
const p3 = Proj{3}()
const p4 = Proj{4}()

# add = PrimRec(p1, Comb(succ, p1))
const add = PrimRec(p1, succ(p1))

# mult = PrimRec(zro, Comb(add, p1, p3))
const mult = PrimRec(zro, add(p1, p3))

const pred = PrimRec(zro, p2)

# cosubrev = PrimRec(p1, Comb(pred, p1))
const cosubrev = PrimRec(p1, pred(p1))

# cosub = Comb(cosubrev, p2, p1)
const cosub = cosubrev(p2, p1)

# dff = Comb(add, cosub, cosubrev)
const dff = add(cosub, cosubrev)

# const1 = Comb(succ, zro)
const const1 = succ(zro)

# sgn = PrimRec(zro, Comb(const1, p1))
const sgn = PrimRec(zro, const1(p1))

# nsgn = PrimRec(const1, Comb(zro, p1))
const nsgn = PrimRec(const1, zro(p1))

# eq = Comb(nsgn, dff)
const eq = nsgn(dff)

# neq = Comb(sgn, dff)
const neq = sgn(dff)

# remainder = PrimRec(
#     zro,
#     Comb(
#         mult,
#         Comb(succ, p1),
#         Comb(neq, p1, Comb(pred, p3)),
#     ),
# )
const remainder = PrimRec(zro, mult(succ(p1), neq(p1, pred(p3))))

# ge = Comb(nsgn, cosubrev)
const ge = nsgn(cosubrev)

ifel = PrimRec(p2, p3)

# square = Comb(mult, p1, p1)
const square = mult(p1, p1)

# floor_sqrt = PrimRec(
#     zro,
#     Comb(ifel, Comb(eq, Comb(square, Comb(succ, p1)), Comb(succ, p2)), Comb(succ, p1), p1),
# )
const floor_sqrt = PrimRec(zro, ifel(eq(square(succ(p1)), succ(p2)), succ(p1), p1))

# traingle = PrimRec(zro, Comb(add, p1, p2))
const traingle = PrimRec(zro, add(p1, p2))

# pair = Comb(add, p1, Comb(traingle, Comb(add, p1, Comb(succ, p2))))
const pair = add(p1, traingle(add(p1, succ(p2))))

# fst = PrimRec(zro, Comb(mult, Comb(neq, Comb(pair, p1, zro), p2), Comb(succ, p1)))
const fst = PrimRec(zro, mult(neq(pair(p1, zro), p2), succ(p1)))

# scd = PrimRec(
#     zro,
#     Comb(
#         ifel,
#         Comb(eq, p2, Comb(pair, Comb(fst, p2), zro)),
#         Comb(succ, Comb(fst, p2)),
#         Comb(pred, p1),
#     ),
# )
const scd = PrimRec(zro, ifel(eq(p2, pair(fst(p2), zro)), succ(fst(p2)), pred(p1)))

# fib_pair = PrimRec(
#     Comb(pair, zro, const1),
#     Comb(pair, Comb(scd, p1), Comb(add, Comb(fst, p1), Comb(scd, p1))),
# )
const fib_pair = PrimRec(pair(zro, const1), pair(scd(p1), add(fst(p1), scd(p1))))

# fib = Comb(fst, fib_pair)
const fib = fst(fib_pair)
