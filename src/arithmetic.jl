p1 = Proj{1}()
p2 = Proj{2}()
p3 = Proj{3}()
p4 = Proj{4}()

add = PrimRec(p1, Comb(succ, p1))

mult = PrimRec(zro, Comb(add, p1, p3))

pred = PrimRec(zro, p2)

cosubrev = PrimRec(p1, Comb(pred, p1))

cosub = Comb(cosubrev, p2, p1)

dff = Comb(add, cosub, cosubrev)

const1 = const1 = Comb(succ, zro)

sgn = PrimRec(zro, Comb(const1, p1))

nsgn = PrimRec(const1, Comb(zro, p1))

eq = Comb(nsgn, dff)

remainder = PrimRec(
    zro,
    Comb(
        mult,
        Comb(mult, Comb(succ, p1), Comb(sgn, p3)),
        Comb(nsgn, Comb(eq, p1, Comb(pred, p3))),
    ),
)

ge = Comb(nsgn, cosubrev)

ifel = PrimRec(p1, p4)

square = Comb(mult, p1, p1)

# floor_inv