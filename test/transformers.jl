include("init.jl")
init8500()


@testset "Transformers" begin 

@test Transformers.NumWindings() == 2
@test Transformers.NumWindings(Transformers.NumWindings()) == 0
@test Transformers.Wdg() == 2
@test Transformers.Wdg(Transformers.Wdg()) == 0
@test Transformers.NumTaps() == 32
@test Transformers.NumTaps(Transformers.NumTaps()) == 0
@test Transformers.IsDelta() == false
@test Transformers.IsDelta(Transformers.IsDelta()) == 0
@test Transformers.First() == 1
@test Transformers.Next() == 2
@test Transformers.Count() == 1190
@test Transformers.R() ≋ 5.0e-6
@test Transformers.R(Transformers.R()) ≋ 0.0
@test Transformers.Tap() ≋ 1.0125
@test Transformers.Tap(Transformers.Tap()) ≋ 0.0
@test Transformers.MinTap() ≋ 0.9
@test Transformers.MinTap(Transformers.MinTap()) ≋ 0.0
@test Transformers.MaxTap() ≋ 1.1
@test Transformers.MaxTap(Transformers.MaxTap()) ≋ 0.0
@test Transformers.kV() ≋ 7.2
@test Transformers.kV(Transformers.kV()) ≋ 0.0
@test Transformers.kVA() ≋ 27500
@test Transformers.kVA(Transformers.kVA()) ≋ 0.0
@test Transformers.Xneut() ≋ 0.0
@test Transformers.Xneut(Transformers.Xneut()) ≋ 0.0
@test Transformers.Rneut() ≋ -1.0
@test Transformers.Rneut(Transformers.Rneut()) ≋ 0.0
@test Transformers.Xhl() ≋ 0.001
@test Transformers.Xhl(Transformers.Xhl()) ≋ 0.0
@test Transformers.Xht() ≋ 0.35
@test Transformers.Xht(Transformers.Xht()) ≋ 0.0
@test Transformers.Xlt() ≋ 0.3
@test Transformers.Xlt(Transformers.Xlt()) ≋ 0.0
@test Transformers.XfmrCode() == ""
@test Transformers.XfmrCode(Transformers.XfmrCode()) == "0"
@test Transformers.Name() == "feeder_rega"
@test Transformers.Name(Transformers.Name()) == "0"
@test Transformers.AllNames()[end] == "vreg4_c"

end # testset

