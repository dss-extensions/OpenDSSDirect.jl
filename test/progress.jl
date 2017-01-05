
init8500()


@testset "Progress" begin 

@test Progress.PctProgress() == 0
@test Progress.Show() == 0
@test Progress.Close() == 0
@test Progress.Caption() == "0"

end # testset

