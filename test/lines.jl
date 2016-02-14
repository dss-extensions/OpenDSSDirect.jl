include("init.jl")
init8500()


@testset "Lines" begin 

@test Lines.First() == 1
@test Lines.Next() == 2
@test Lines.Phases() == 1
@test Lines.Phases(Lines.Phases()) == 0
@test Lines.NumCust() == 0
@test Lines.Parent() == 0
@test Lines.Count() == 3703
@test Lines.Units() == 3
@test Lines.Units(Lines.Units()) == 0
@test Lines.Length() ≋ 0.032175613
@test Lines.Length(Lines.Length()) ≋ 0.0
@test Lines.R1() ≋ 0.058
@test Lines.R1(Lines.R1()) ≋ 0.0
@test Lines.X1() ≋ 0.1206
@test Lines.X1(Lines.X1()) ≋ 0.0
@test Lines.R0() ≋ 0.1784
@test Lines.R0(Lines.R0()) ≋ 0.0
@test Lines.X0() ≋ 0.4047
@test Lines.X0(Lines.X0()) ≋ 0.0
@test Lines.C1() ≋ 3.4
@test Lines.C1(Lines.C1()) ≋ 0.0
@test Lines.C0() ≋ 1.6
@test Lines.C0(Lines.C0()) ≋ 0.0
@test Lines.NormAmps() ≋ 400.0
@test Lines.NormAmps(Lines.NormAmps()) ≋ 0.0
@test Lines.EmergAmps() ≋ 600.0
@test Lines.EmergAmps(Lines.EmergAmps()) ≋ 0.0
@test Lines.Rg() ≋ 0.01805
@test Lines.Rg(Lines.Rg()) ≋ 0.0
@test Lines.Xg() ≋ 0.155081
@test Lines.Xg(Lines.Xg()) ≋ 0.0
@test Lines.Rho() ≋ 100.0
@test Lines.Rho(Lines.Rho()) ≋ 0.0
@test Lines.Name() == "ln5502549-1"
@test Lines.Name(Lines.Name()) == ""
@test Lines.Bus1() == "m1009763.2"
@test Lines.Bus1(Lines.Bus1()) == ""
@test Lines.Bus2() == "l2673322.2"
@test Lines.Bus2(Lines.Bus2()) == ""
@test Lines.LineCode() == "1ph-x4_acsrx4_acsr"
@test Lines.LineCode(Lines.LineCode()) == ""
@test Lines.Geometry() == ""
@test Lines.Geometry(Lines.Geometry()) == ""
@test Lines.Spacing() == ""
@test Lines.Spacing(Lines.Spacing()) == ""
@test Lines.AllNames()[end] == "tpx2224500658a0"
@test Lines.RMatrix() ≋ [1.67466]
# @test Lines.RMatrix(Lines.RMatrix())
@test Lines.XMatrix() ≋ [0.93456]
# @test Lines.XMatrix(Lines.XMatrix())
@test Lines.CMatrix() ≋ [6.322849999999999]
# @test Lines.CMatrix(Lines.CMatrix())
@test Lines.Yprim() ≋ [14.151460302936526 - 7.897357479424346im -14.151460302936526 + 7.897357517772179im
                      -14.151460302936526 + 7.897357517772179im 14.151460302936526 - 7.897357479424346im]
# @test Lines.Yprim(Lines.Yprim())

end # testset

