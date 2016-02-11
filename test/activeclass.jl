include("init.jl")
init8500()

@testset "activeclass" begin 

@test activeclass(:First) == 1
@test activeclass(:Next) == 2
@test activeclass(:NumElements) == 12
@test activeclass(:Count) == 12
@test activeclass(:Name) == "feeder_regb"
@test activeclass(:Name, activeclass(:Name)) == "0"
@test activeclass(:ActiveClassName) == "RegControl"
x = activeclass(:AllNames)
@test length(x) == activeclass(:Count)
@test x[1] == "feeder_rega"

end # testset