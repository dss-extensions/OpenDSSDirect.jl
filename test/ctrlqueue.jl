include("init.jl")
init8500()


@testset "ctrlqueue" begin 

@show ctrlqueue(:ClearQueue)
# @show ctrlqueue(:Delete)
@show ctrlqueue(:NumActions)
# @show ctrlqueue(:Action, ctrlqueue(:Action))
@show ctrlqueue(:ActionCode)
@show ctrlqueue(:DeviceHandle)
@show ctrlqueue(:Push)
@show ctrlqueue(:Show)
@show ctrlqueue(:ClearActions)
@show ctrlqueue(:PopAction)

end # testset

