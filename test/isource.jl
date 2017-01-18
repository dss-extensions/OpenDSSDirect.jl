
init8500()


@testset "Isource" begin 

@test Isource.Count() == 0
@test Isource.First() == 0
@test Isource.Next() == 0
@test Isource.Amps() == 0.0
@test Isource.Amps(Isource.Amps()) == 0.0
@test Isource.AngleDeg() == 0.0
@test Isource.AngleDeg(Isource.AngleDeg()) == 0.0
@test Isource.Frequency() == 0.0
@test Isource.Frequency(Isource.Frequency()) == 0.0
@test Isource.Name() == "vreg4_c"
# @test Isource.Name(Isource.Name())
@test Isource.AllNames()[end] == "NONE"

end # testset
