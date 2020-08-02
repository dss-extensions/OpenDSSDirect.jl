init8500()

@testset "Error" begin

@test Error.Description() == ""
@test Error.Number() == 0

@test Error.ExtendedErrors()

@test Isource.First() == 0

@test_throws OpenDSSDirect.OpenDSSDirectException Isource.Name()

@test Error.ExtendedErrors(false) == nothing

@test Isource.Name() == ""

@test Error.ExtendedErrors(true) == nothing

end # testset
