
dir =  joinpath(@__DIR__, "../examples")

@testset "Examples" begin

    println("Timing 8760.jl")
    @time @test include(joinpath(dir, "8760.jl")) === nothing
    println("Timing custom_8760.jl")
    @time @test include(joinpath(dir, "custom_8760.jl")) === nothing

    @test include(joinpath(dir, "timings.jl")) === nothing

    cd(joinpath(@__DIR__, ".."))
    @test abspath(download(OpenDSSDirect.Examples, force = true)) == abspath(joinpath(@__DIR__, "../examples/electricdss-tst-master"))

end # testset
