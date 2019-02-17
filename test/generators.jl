
init8500()

OpenDSSDirect.Text.Command("""
    redirect $(dirname(pathof(OpenDSSDirect)))/../examples/8500-Node/Generators.dss
    solve
""")

@testset "Generators" begin

@test Generators.First() == 1
@test Generators.Next() == 0
@test Generators.ForcedON() == 0
@test Generators.ForcedON(Generators.ForcedON()) == nothing
@test Generators.Phases() == 3
@test Generators.Phases(Generators.Phases()) == nothing
@test Generators.Count() == 1
@test Generators.Idx() == 1
@test Generators.Idx(Generators.Idx()) == nothing
@test Generators.Model() == 1
@test Generators.Model(Generators.Model()) == nothing
@test Generators.kV() ≋ 0.48
@test Generators.kV(Generators.kV()) == nothing
@test Generators.kW() ≋ 1000.0
@test Generators.kW(Generators.kW()) == nothing
@test Generators.kvar() ≋ 0.0
@test Generators.kvar(Generators.kvar()) == nothing
@test Generators.PF() ≋ 1.0
@test Generators.PF(Generators.PF()) == nothing
@test Generators.kVARated() ≋ 1000.0
@test Generators.kVARated(Generators.kVARated()) == nothing
@test Generators.Vmaxpu() ≋ 1.1
@test Generators.Vmaxpu(Generators.Vmaxpu()) == nothing
@test Generators.Vminpu() ≋ 0.9
@test Generators.Vminpu(Generators.Vminpu()) == nothing
@test Generators.Name() == "g_m1125934"
@test Generators.Name(Generators.Name()) == nothing
@test Generators.AllNames() == ["g_m1125934"]
@test Generators.RegisterNames() == ["kWh","kvarh","Max kW","Max kVA","Hours","\$"]
@test Generators.RegisterValues() == [0.0,0.0,0.0,0.0,0.0,0.0]

arr = String[]
for i in OpenDSSDirect.EachMember(Generators); push!(arr, Generators.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Generators, Generators.Name))
    @test n == arr[i]
end
@test arr == Generators.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Generators))

end # testset

