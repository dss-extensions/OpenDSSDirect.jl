include("init.jl")
init8500()


@testset "lines" begin 

@test lines(:First) == 1
@test lines(:Next) == 2
@test lines(:Phases) == 1
@test lines(:Phases, lines(:Phases)) == 0
@test lines(:NumCust) == 0
@test lines(:Parent) == 0
@test lines(:Count) == 3703
@test lines(:Units) == 3
@test lines(:Units, lines(:Units)) == 0
@test lines(:Length) ≈ 0.032175613
@test lines(:Length, lines(:Length)) ≈ 0.0
@test lines(:R1) ≈ 0.058
@test lines(:R1, lines(:R1)) ≈ 0.0
@test lines(:X1) ≈ 0.1206
@test lines(:X1, lines(:X1)) ≈ 0.0
@test lines(:R0) ≈ 0.1784
@test lines(:R0, lines(:R0)) ≈ 0.0
@test lines(:X0) ≈ 0.4047
@test lines(:X0, lines(:X0)) ≈ 0.0
@test lines(:C1) ≈ 3.4
@test lines(:C1, lines(:C1)) ≈ 0.0
@test lines(:C0) ≈ 1.6
@test lines(:C0, lines(:C0)) ≈ 0.0
@test lines(:NormAmps) ≈ 400.0
@test lines(:NormAmps, lines(:NormAmps)) ≈ 0.0
@test lines(:EmergAmps) ≈ 600.0
@test lines(:EmergAmps, lines(:EmergAmps)) ≈ 0.0
@test lines(:Rg) ≈ 0.01805
@test lines(:Rg, lines(:Rg)) ≈ 0.0
@test lines(:Xg) ≈ 0.155081
@test lines(:Xg, lines(:Xg)) ≈ 0.0
@test lines(:Rho) ≈ 100.0
@test lines(:Rho, lines(:Rho)) ≈ 0.0
@test lines(:Name) == "ln5502549-1"
@test lines(:Name, lines(:Name)) == ""
@test lines(:Bus1) == "m1009763.2"
@test lines(:Bus1, lines(:Bus1)) == ""
@test lines(:Bus2) == "l2673322.2"
@test lines(:Bus2, lines(:Bus2)) == ""
@test lines(:LineCode) == "1ph-x4_acsrx4_acsr"
@test lines(:LineCode, lines(:LineCode)) == ""
@test lines(:Geometry) == ""
@test lines(:Geometry, lines(:Geometry)) == ""
@test lines(:Spacing) == ""
@test lines(:Spacing, lines(:Spacing)) == ""
@test lines(:AllNames)[end] == "tpx2224500658a0"
@test lines(:RMatrix) ≈ [1.67466]
# @test lines(:RMatrix, lines(:RMatrix))
@test lines(:XMatrix) ≈ [0.93456]
# @test lines(:XMatrix, lines(:XMatrix))
@test lines(:CMatrix) ≈ [6.322849999999999]
# @test lines(:CMatrix, lines(:CMatrix))
@test lines(:Yprim) ≈ [14.151460302936526 - 7.897357479424346im -14.151460302936526 + 7.897357517772179im
                      -14.151460302936526 + 7.897357517772179im 14.151460302936526 - 7.897357479424346im]
# @test lines(:Yprim, lines(:Yprim))

end # testset

