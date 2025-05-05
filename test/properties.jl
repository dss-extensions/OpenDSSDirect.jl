
init8500()


@testset "Properties" begin


# Set an invalid property through the low-level interface to test if exceptions work
OpenDSSDirect.Lib.DSSProperty_Set_Index(C_NULL, -1)
@test_throws OpenDSSDirect.OpenDSSDirectException Properties.Description() == ""
@test_throws OpenDSSDirect.OpenDSSDirectException Properties.Name() == ""

Properties._setCurrentProperty(1)
@test uppercase(Properties.Value()) == "VREG4_C"

@test replace(Properties.Description(), "\r\n" => "\n") == "Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" or \"AutoTrans\" is assumed for the object class.  Example:\n\nTransformer=Xfmr1"

@test lowercase(Properties.Name()) == "transformer"

Properties._setCurrentProperty("1")
@test uppercase(Properties.Value()) == "VREG4_C"

@test replace(Properties.Description(), "\r\n" => "\n") == "Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" or \"AutoTrans\" is assumed for the object class.  Example:\n\nTransformer=Xfmr1"

@test lowercase(Properties.Name()) == "transformer"

Properties._setCurrentProperty("transformer")
@test uppercase(Properties.Value()) == "VREG4_C"

@test replace(Properties.Description(), "\r\n" => "\n") == "Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; \"Transformer\" or \"AutoTrans\" is assumed for the object class.  Example:\n\nTransformer=Xfmr1"

@test lowercase(Properties.Name()) == "transformer"

@test uppercase(Properties.Value("transformer")) == "VREG4_C"

# An invalid property value is not allowed anymore removes the association since DSS C-API 0.12
@test_throws OpenDSSDirect.OpenDSSDirectException Properties.Value("transformer", "VREG4_C_new") === nothing
@test uppercase(Properties.Value("transformer")) == "" 

end # testset
