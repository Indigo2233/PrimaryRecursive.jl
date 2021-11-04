@testset "arithmetic.jl" begin
    @testset "projection" begin
        for i in 1:5, j in 1:5, k in 1:5
            @test p1(i, j, k) == i
            @test p2(i, j, k) == j
            @test p3(i, j, k) == k
        end
    end
    @testset "addition" begin
        for i in 1:10, j in 1:10
            @test add(i, j) == i + j
        end
    end
    @testset "multi" begin
        for i in 1:10, j in 1:10
            @test mult(i, j) == i * j
        end
    end
    @testset "pred" begin
        for i in 1:10
            @test pred(i) == max(0, i - 1)
        end
    end
    @testset "cosub" begin
        for i in 1:10, j in rand(1:10, 10)
            @test cosub(i, j) == max(0, i - j)
        end
    end
    @testset "diff" begin
        for i in 1:10, j in rand(1:10, 10)
            @test dff(i, j) == abs(i - j)
        end
    end
    @testset "const1" begin
        for i in 1:10
            @test const1(i) == 1
        end
    end
    @testset "reminder" begin
        for i in 0:10, j in 1:5
            @test remainder(i, j) == i % j
        end
    end
    @testset "square" begin
        for i in 0:10
            @test square(i) == i ^ 2
        end
    end
end