@testset "relation.jl" begin
    @testset "sgn" begin
        for i in 0:10
            @test sgn(i) == 1 - nsgn(i) == Int(i != 0)
        end
    end
    @testset "ge" begin
        for i in 0:10, j in rand(0:10, 10)
            @test ge(i, j) == Int(i >= j)            
        end
    end
    @testset "ifelse" begin
        for _ in 1:10, b in 0:5
            x, y = rand(0:10, 2)
            @test ifel(b, x, y) == ifelse(b == 0, x, y)
        end
    end
end
