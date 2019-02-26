

init8500()


@testset "LineCodes" begin

@test LineCodes.First() == 1
@test LineCodes.Next() == 2
@test LineCodes.Phases() == 1
@test LineCodes.Phases(LineCodes.Phases()) == nothing
@test LineCodes.Count() == 71
@test LineCodes.Units() == 3
@test LineCodes.Units() == OpenDSSDirect.Lib.LineUnits_km
@test LineCodes.Units(3) == nothing
@test LineCodes.Units(OpenDSSDirect.Lib.LineUnits_km) == nothing
@test LineCodes.IsZ1Z0() == false
@test LineCodes.R1() ≋ 0.058
@test LineCodes.R1(LineCodes.R1()) == nothing
@test LineCodes.X1() ≋ 0.1206
@test LineCodes.X1(LineCodes.X1()) == nothing
@test LineCodes.R0() ≋ 0.1784
@test LineCodes.R0(LineCodes.R0()) == nothing
@test LineCodes.X0() ≋ 0.4047
@test LineCodes.X0(LineCodes.X0()) == nothing
@test LineCodes.C1() ≋ 3.4e-9
@test LineCodes.C1(LineCodes.C1()) == nothing
@test LineCodes.C0() ≋ 1.6e-9
@test LineCodes.C0(LineCodes.C0()) == nothing
@test LineCodes.NormAmps() ≋ 400.0
@test LineCodes.NormAmps(LineCodes.NormAmps()) == nothing
@test LineCodes.EmergAmps() ≋ 600.0
@test LineCodes.EmergAmps(LineCodes.EmergAmps()) == nothing
@test LineCodes.Name() == "1ph-xx4_acsr4_acsr"
@test LineCodes.Name(LineCodes.Name()) == nothing
@test LineCodes.AllNames()[end] == "4/0triplex"
@test LineCodes.Rmatrix() ≋ [0.40995115 0.11809509; 0.11809509 0.40995115] # TODO: change Rmatrix to RMatrix to be consistent with Lines
@test LineCodes.Rmatrix(LineCodes.Rmatrix()) == nothing # TODO: change Rmatrix to RMatrix to be consistent with Lines
@test LineCodes.Xmatrix() ≋ [0.16681819 0.1275925; 0.1275925 0.16681819] # TODO: change Xmatrix to XMatrix to be consistent with Lines
@test LineCodes.Xmatrix(LineCodes.Xmatrix()) == nothing # TODO: change Xmatrix to XMatrix to be consistent with Lines
@test LineCodes.Cmatrix() ≋ [3 -2.4; -2.4 3.0] # TODO: change Cmatrix to CMatrix to be consistent with Lines
@test LineCodes.Cmatrix(LineCodes.Cmatrix()) == nothing # TODO: change Cmatrix to CMatrix to be consistent with Lines
@test isapprox(LineCodes.Zmatrix(), [0.409951+0.166818im  0.118095+0.127592im;
                              0.118095+0.127592im  0.409951+0.166818im], rtol=0.00001)
@test LineCodes.Zmatrix(LineCodes.Zmatrix()) == nothing

arr = String[]
for i in OpenDSSDirect.EachMember(LineCodes); push!(arr, LineCodes.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(LineCodes, LineCodes.Name))
    @test n == arr[i]
end
@test arr == LineCodes.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(LineCodes))

end # testset

