include("init.jl")
init8500()


@testset "transformers" begin 

@test transformers(:NumWindings) == 2
@test transformers(:NumWindings, transformers(:NumWindings)) == 0
@test transformers(:Wdg) == 2
@test transformers(:Wdg, transformers(:Wdg)) == 0
@test transformers(:NumTaps) == 32
@test transformers(:NumTaps, transformers(:NumTaps)) == 0
@test transformers(:IsDelta) == false
@test transformers(:IsDelta, transformers(:IsDelta)) == 0
@test transformers(:First) == 1
@test transformers(:Next) == 2
@test transformers(:Count) == 1190
@test transformers(:R) ≈ 5.0e-6
@test transformers(:R, transformers(:R)) ≈ 0.0
@test transformers(:Tap) ≈ 1.0125
@test transformers(:Tap, transformers(:Tap)) ≈ 0.0
@test transformers(:MinTap) ≈ 0.9
@test transformers(:MinTap, transformers(:MinTap)) ≈ 0.0
@test transformers(:MaxTap) ≈ 1.1
@test transformers(:MaxTap, transformers(:MaxTap)) ≈ 0.0
@test transformers(:kV) ≈ 7.2
@test transformers(:kV, transformers(:kV)) ≈ 0.0
@test transformers(:kVA) ≈ 27500
@test transformers(:kVA, transformers(:kVA)) ≈ 0.0
@test transformers(:Xneut) ≈ 0.0
@test transformers(:Xneut, transformers(:Xneut)) ≈ 0.0
@test transformers(:Rneut) ≈ -1.0
@test transformers(:Rneut, transformers(:Rneut)) ≈ 0.0
@test transformers(:Xhl) ≈ 0.001
@test transformers(:Xhl, transformers(:Xhl)) ≈ 0.0
@test transformers(:Xht) ≈ 0.35
@test transformers(:Xht, transformers(:Xht)) ≈ 0.0
@test transformers(:Xlt) ≈ 0.3
@test transformers(:Xlt, transformers(:Xlt)) ≈ 0.0
@test transformers(:XfmrCode) == ""
@test transformers(:XfmrCode, transformers(:XfmrCode)) == "0"
@test transformers(:Name) == "feeder_rega"
@test transformers(:Name, transformers(:Name)) == "0"
@test transformers(:AllNames)[end] == "vreg4_c"

end # testset

