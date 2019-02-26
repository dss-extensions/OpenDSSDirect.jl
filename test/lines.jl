
init8500()


@testset "Lines" begin

@test Lines.RMatrix() == reshape([], (0, 0))
@test Lines.CMatrix() == reshape([], (0, 0))
@test Lines.XMatrix() == reshape([], (0, 0))

@test Lines.First() == 1
@test Lines.Next() == 2
@test Lines.Phases() == 1
@test Lines.Phases(Lines.Phases()) == nothing
@test Lines.NumCust() == 0
@test Lines.Parent() == 0
@test Lines.Count() == 3703
@test Lines.Units() == 3
@test Lines.Units() == OpenDSSDirect.Lib.LineUnits_km
@test Lines.Units(3) == nothing
@test Lines.Units(OpenDSSDirect.Lib.LineUnits_km) == nothing
@test Lines.Length() ≋ 0.032175613
@test Lines.Length(Lines.Length()) == nothing
@test Lines.R1() ≋ 0.058
@test Lines.R1(Lines.R1()) == nothing
@test Lines.X1() ≋ 0.1206
@test Lines.X1(Lines.X1()) == nothing
@test Lines.R0() ≋ 0.1784
@test Lines.R0(Lines.R0()) == nothing
@test Lines.X0() ≋ 0.4047
@test Lines.X0(Lines.X0()) == nothing
@test Lines.C1() ≋ 3.4
@test Lines.C1(Lines.C1()) == nothing
@test Lines.C0() ≋ 1.6
@test Lines.C0(Lines.C0()) == nothing
@test Lines.NormAmps() ≋ 400.0
@test Lines.NormAmps(Lines.NormAmps()) == nothing
@test Lines.EmergAmps() ≋ 600.0
@test Lines.EmergAmps(Lines.EmergAmps()) == nothing
@test Lines.Rg() ≋ 0.01805
@test Lines.Rg(Lines.Rg()) == nothing
@test Lines.Xg() ≋ 0.155081
@test Lines.Xg(Lines.Xg()) == nothing
@test Lines.Rho() ≋ 100.0
@test Lines.Rho(Lines.Rho()) == nothing
@test Lines.Name() == "ln5502549-1"
@test Lines.Name(Lines.Name()) == nothing
@test Lines.Bus1() == "m1009763.2"
@test Lines.Bus1(Lines.Bus1()) == nothing
@test Lines.Bus2() == "l2673322.2"
@test Lines.Bus2(Lines.Bus2()) == nothing
@test Lines.LineCode() == "1ph-x4_acsrx4_acsr"
@test Lines.LineCode(Lines.LineCode()) == nothing
@test Lines.Geometry() == ""
@test Lines.Geometry(Lines.Geometry()) == nothing
@test Lines.Spacing() == ""
@test Lines.Spacing(Lines.Spacing()) == nothing
@test Lines.AllNames()[end] == "tpx2224500658a0"
@test Lines.RMatrix() ≋ reshape([1.67466], (1, 1))
@test Lines.RMatrix(Lines.RMatrix()) == nothing
@test Lines.XMatrix() ≋ reshape([0.93456], (1, 1))
@test Lines.XMatrix(Lines.XMatrix()) == nothing
@test Lines.CMatrix() ≋ reshape([6.322849999999999], (1, 1))
@test Lines.CMatrix(Lines.CMatrix()) == nothing
@test Lines.Yprim() ≋ [14.151460302936526 - 7.897357479424346im -14.151460302936526 + 7.897357517772179im
                      -14.151460302936526 + 7.897357517772179im 14.151460302936526 - 7.897357479424346im]
@test Lines.Yprim(Lines.Yprim()) == nothing

@test Lines.ZMatrix() ≋ reshape([1.67466 + 0.93456im], (1, 1))
@test Lines.ZMatrix(Lines.ZMatrix()) == nothing

arr = String[]
for i in OpenDSSDirect.EachMember(Lines); push!(arr, Lines.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Lines, Lines.Name))
    @test n == arr[i]
end
@test arr[1:250] == Lines.AllNames()[1:250]
# TODO: 5 lines are disabled, and iterator protocol does not return disabled lines
@test length(arr) + 5 == length(Lines.AllNames())
@test length(arr) + 5 == length(OpenDSSDirect.EachMember(Lines))

end # testset

