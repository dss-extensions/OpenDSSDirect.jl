
init8500()


@testset "Element" begin

@test Element.NumProperties() == 35
@test Element.Name() == "RegControl.vreg4_c"
@test lowercase(Element.AllPropertyNames()[1]) == "transformer"

trjson = replace(lowercase(Element.ToJSON(Int32(0))), r"\s" => "")
@test occursin("vreg4_c", trjson)
@test occursin("\"winding\":2", trjson)
@test occursin("\"vreg\":1.25", trjson)

end # testset

