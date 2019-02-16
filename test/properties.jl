
init8500()


@testset "Properties" begin


@test Properties.Description() == ""
@test Properties.Name() == ""

OpenDSSDirect.Lib.DSSProperty_Set_Index(0)  # TODO: use higher level function?
@test Properties.Value() == "VREG4_C"
@test replace(Properties.Description(), "\r\n" => "\n") == "Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" or \"AutoTrans\" is assumed for the object class.  Example:\n\nTransformer=Xfmr1"
@test Properties.Name() == "transformer"

Properties._setCurrentProperty("1")
@test Properties.Value() == "VREG4_C"
@test replace(Properties.Description(), "\r\n" => "\n") == "Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" or \"AutoTrans\" is assumed for the object class.  Example:\n\nTransformer=Xfmr1"
@test Properties.Name() == "transformer"

Properties._setCurrentProperty("transformer")
@test Properties.Value() == "VREG4_C"
@test replace(Properties.Description(), "\r\n" => "\n") == "Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" or \"AutoTrans\" is assumed for the object class.  Example:\n\nTransformer=Xfmr1"
@test Properties.Name() == "transformer"

@test Properties.Value("transformer") == "VREG4_C"

@test Properties.Value("transformer", "VREG4_C_new") == nothing
@test Properties.Value("transformer") == "VREG4_C_new"

end # testset

