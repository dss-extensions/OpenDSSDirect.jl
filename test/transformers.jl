
init8500()


@testset "Transformers" begin

@test Transformers.NumWindings() == 2
@test Transformers.NumWindings(Transformers.NumWindings()) == nothing
@test Transformers.Wdg() == 2
@test Transformers.Wdg(Transformers.Wdg()) == nothing
@test Transformers.NumTaps() == 32
@test Transformers.NumTaps(Transformers.NumTaps()) == nothing
@test Transformers.IsDelta() == false
@test Transformers.IsDelta(Transformers.IsDelta()) == nothing
@test Transformers.First() == 1
@test Transformers.Next() == 2
@test Transformers.Count() == 1190
@test Transformers.R() ≋ 5.0e-6
@test Transformers.R(Transformers.R()) == nothing
@test Transformers.Tap() ≋ 1.0125
@test Transformers.Tap(Transformers.Tap()) == nothing
@test Transformers.MinTap() ≋ 0.9
@test Transformers.MinTap(Transformers.MinTap()) == nothing
@test Transformers.MaxTap() ≋ 1.1
@test Transformers.MaxTap(Transformers.MaxTap()) == nothing
@test Transformers.kV() ≋ 7.2
@test Transformers.kV(Transformers.kV()) == nothing
@test Transformers.kVA() ≋ 27500
@test Transformers.kVA(Transformers.kVA()) == nothing
@test Transformers.Xneut() ≋ 0.0
@test Transformers.Xneut(Transformers.Xneut()) == nothing
@test Transformers.Rneut() ≋ -1.0
@test Transformers.Rneut(Transformers.Rneut()) == nothing
@test Transformers.Xhl() ≋ 0.001
@test Transformers.Xhl(Transformers.Xhl()) == nothing
@test Transformers.Xht() ≋ 0.35
@test Transformers.Xht(Transformers.Xht()) == nothing
@test Transformers.Xlt() ≋ 0.3
@test Transformers.Xlt(Transformers.Xlt()) == nothing
@test Transformers.XfmrCode() == ""
@test Transformers.XfmrCode(Transformers.XfmrCode()) == nothing
@test Transformers.Name() == "feeder_rega"
@test Transformers.Name(Transformers.Name()) == nothing
@test Transformers.AllNames()[end] == "vreg4_c"

arr = String[]
for i in OpenDSSDirect.EachMember(Transformers); push!(arr, Transformers.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Transformers, Transformers.Name))
    @test n == arr[i]
end
@test arr == Transformers.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Transformers))
end # testset

