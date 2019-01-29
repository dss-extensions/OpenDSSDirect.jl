
@testset "YMatrix" begin

init8500()

data, indices, indptr = YMatrix.getYsparse()
@test length(data) == 46299
@test length(indices) == 46299
@test length(indptr) == 8542

# @show YMatrix.IVector()

end # testset

