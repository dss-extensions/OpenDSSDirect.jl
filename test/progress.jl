include("init.jl")
init8500()


@testset "progress" begin 

@test progress(:PctProgress) == 0
@test progress(:Show) == 0
@test progress(:Close) == 0
@test progress(:Caption) == "0"

end # testset

