include("init.jl")
init8500()
    
dss("""
    redirect $(Pkg.dir())/OpenDSSDirect/examples/8500-Node/Generators.dss
    solve
""")

@testset "generators" begin 

@test generators(:First) == 1
@test generators(:Next) == 0
@test generators(:ForcedON) == 0
@test generators(:ForcedON, generators(:ForcedON)) == 0
@test generators(:Phases) == 3
@test generators(:Phases, generators(:Phases)) == 0
@test generators(:Count) == 1
@test generators(:Idx) == 1
@test generators(:Idx, generators(:Idx)) == 0
@test generators(:Model) == 1
@test generators(:Model, generators(:Model)) == 0
@test generators(:kV) ≈ 0.48
@test generators(:kV, generators(:kV)) ≈ 0.0
@test generators(:kW) ≈ 1000.0
@test generators(:kW, generators(:kW)) ≈ 0.0
@test generators(:kvar) ≈ 0.0
@test generators(:kvar, generators(:kvar)) ≈ 0.0
@test generators(:PF) ≈ 1.0
@test generators(:PF, generators(:PF)) ≈ 0.0
@test generators(:kVARated) ≈ 1000.0
@test generators(:kVARated, generators(:kVARated)) ≈ 0.0
@test generators(:Vmaxpu) ≈ 1.1
@test generators(:Vmaxpu, generators(:Vmaxpu)) ≈ 0.0
@test generators(:Vminpu) ≈ 0.9
@test generators(:Vminpu, generators(:Vminpu)) ≈ 0.0
@test generators(:Name) == "g_m1125934"
@test generators(:Name, generators(:Name)) == ""
@test generators(:AllNames) == ["g_m1125934"]
@test generators(:RegisterNames) == ["kWh","kvarh","Max kW","Max kVA","Hours","\$"]
@test generators(:RegisterValues) == [0.0,0.0,0.0,0.0,0.0,0.0]

end # testset

