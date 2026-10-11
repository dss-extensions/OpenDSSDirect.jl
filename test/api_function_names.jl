@testset "API functions sharing Base type names" begin
    @test Error.Number !== Base.Number
    @test Solution.Number !== Base.Number
    @test Error.Number !== Solution.Number
    @test Monitors.Channel !== Base.Channel
    @test Parser.Matrix !== Base.Matrix
    @test Parser.Vector !== Base.Vector
end
