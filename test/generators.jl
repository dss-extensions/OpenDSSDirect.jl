
init8500()
    
dss("""
    redirect $(dirname(pathof(OpenDSSDirect)))/../examples/8500-Node/Generators.dss
    solve
""")

@testset "Generators" begin 

@test Generators.First() == 1
@test Generators.Next() == 0
@test Generators.ForcedON() == 0
@test Generators.ForcedON(Generators.ForcedON()) == 0
@test Generators.Phases() == 3
@test Generators.Phases(Generators.Phases()) == 0
@test Generators.Count() == 1
@test Generators.Idx() == 1
@test Generators.Idx(Generators.Idx()) == 0
@test Generators.Model() == 1
@test Generators.Model(Generators.Model()) == 0
@test Generators.kV() ≋ 0.48
@test Generators.kV(Generators.kV()) ≋ 0.0
@test Generators.kW() ≋ 1000.0
@test Generators.kW(Generators.kW()) ≋ 0.0
@test Generators.kvar() ≋ 0.0
@test Generators.kvar(Generators.kvar()) ≋ 0.0
@test Generators.PF() ≋ 1.0
@test Generators.PF(Generators.PF()) ≋ 0.0
@test Generators.kVARated() ≋ 1000.0
@test Generators.kVARated(Generators.kVARated()) ≋ 0.0
@test Generators.Vmaxpu() ≋ 1.1
@test Generators.Vmaxpu(Generators.Vmaxpu()) ≋ 0.0
@test Generators.Vminpu() ≋ 0.9
@test Generators.Vminpu(Generators.Vminpu()) ≋ 0.0
@test Generators.Name() == "g_m1125934"
@test Generators.Name(Generators.Name()) == ""
@test Generators.AllNames() == ["g_m1125934"]
@test Generators.RegisterNames() == ["kWh","kvarh","Max kW","Max kVA","Hours","\$"]
@test Generators.RegisterValues() == [0.0,0.0,0.0,0.0,0.0,0.0]

end # testset

