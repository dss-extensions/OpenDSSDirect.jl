include("init.jl")
init8500()


@testset "element" begin 

@test element(:NumProperties) == 31
@test element(:Name) == "RegControl.vreg4_c"
@test element(:AllPropertyNames)[1] == "transformer"

end # testset

