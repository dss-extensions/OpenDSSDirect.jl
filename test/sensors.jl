
init8500()


@testset "Sensors" begin

@show Sensors.Count()
@show Sensors.First()
@show Sensors.Next()
@show Sensors.IsDelta()
@show Sensors.IsDelta(Sensors.IsDelta())
@show Sensors.ReverseDelta()
@show Sensors.ReverseDelta(Sensors.ReverseDelta())
@show Sensors.MeteredTerminal()
@show Sensors.MeteredTerminal(Sensors.MeteredTerminal())
@show Sensors.Reset()
@show Sensors.ResetAll()
@show Sensors.PctError()
@show Sensors.PctError(Sensors.PctError())
@show Sensors.Weight()
@show Sensors.Weight(Sensors.Weight())
@show Sensors.kVBase()
@show Sensors.kVBase(Sensors.kVBase())
@show Sensors.Name()
@show Sensors.Name(Sensors.Name())
@show Sensors.MeteredElement()
@show Sensors.MeteredElement(Sensors.MeteredElement())
@show Sensors.AllNames()
@show Sensors.Currents()
@show Sensors.Currents(Sensors.Currents())
@show Sensors.kvar()
@show Sensors.kvar(Sensors.kvar())
@show Sensors.kW()
@show Sensors.kW(Sensors.kW())
@show Sensors.kVS()
@show Sensors.kVS(Sensors.kVS())

arr = String[]
for i in OpenDSSDirect.EachMember(Sensors); push!(arr, Sensors.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Sensors, Sensors.Name))
    @test n == arr[i]
end
@test arr == Sensors.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Sensors))

end # testset

