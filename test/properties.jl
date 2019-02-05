
init8500()


@testset "Properties" begin


@test Properties.Description() == ""
@test Properties.Name() == ""

OpenDSSDirect.Lib.DSSProperty_Set_Index(0)  # TODO: use higher level function?
@test Properties.Value() == "VREG4_C"
@test Properties.Description() == "Name of Transformer element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" is assumed for the object class.  Example:\r\n\r\nTransformer=Xfmr1"
@test Properties.Name() == "transformer"

Properties._setCurrentProperty("1")
@test Properties.Value() == "VREG4_C"
@test Properties.Description() == "Name of Transformer element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" is assumed for the object class.  Example:\r\n\r\nTransformer=Xfmr1"
@test Properties.Name() == "transformer"

Properties._setCurrentProperty("transformer")
@test Properties.Value() == "VREG4_C"
@test Properties.Description() == "Name of Transformer element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" is assumed for the object class.  Example:\r\n\r\nTransformer=Xfmr1"
@test Properties.Name() == "transformer"

end # testset

