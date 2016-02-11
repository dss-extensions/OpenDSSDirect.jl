include("init.jl")
init8500()


@testset "isource" begin 

@show isource(:Count)
@show isource(:First)
@show isource(:Next)
@show isource(:Amps)
@show isource(:Amps, isource(:Amps))
@show isource(:AngleDeg)
@show isource(:AngleDeg, isource(:AngleDeg))
@show isource(:Frequency)
@show isource(:Frequency, isource(:Frequency))
@show isource(:Name)
@show isource(:Name, isource(:Name))
@show isource(:AllNames)

end # testset

