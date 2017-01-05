
init8500()


@testset "Isource" begin 

@show Isource.Count()
@show Isource.First()
@show Isource.Next()
@show Isource.Amps()
@show Isource.Amps(Isource.Amps())
@show Isource.AngleDeg()
@show Isource.AngleDeg(Isource.AngleDeg())
@show Isource.Frequency()
@show Isource.Frequency(Isource.Frequency())
@show Isource.Name()
@show Isource.Name(Isource.Name())
@show Isource.AllNames()

end # testset

