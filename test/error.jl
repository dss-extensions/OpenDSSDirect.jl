init8500()

@testset "Error" begin

@test Error.Description() == ""
@test Error.Number() == 0

end # testset
