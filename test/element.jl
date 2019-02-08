
init8500()


@testset "Element" begin

@test Element.NumProperties() == 35
@test Element.Name() == "RegControl.vreg4_c"
@test Element.AllPropertyNames()[1] == "transformer"

end # testset

