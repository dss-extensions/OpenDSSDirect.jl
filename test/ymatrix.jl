
@testset "YMatrix" begin

init8500()

ymatrix = YMatrix.getYsparse()
@test ymatrix[1,1] ≋ -1000.067575299307im
@test ymatrix[1,10] ≋ 0.0im

# ymatrix = YMatrix.getYsparse()

@test length(YMatrix.getV()) == 8542
@test length(YMatrix.getI()) == 8542

@test YMatrix.SystemYChanged() == false
@test YMatrix.SystemYChanged(YMatrix.SystemYChanged()) === nothing

@test YMatrix.UseAuxCurrents() == false
@test YMatrix.UseAuxCurrents(YMatrix.UseAuxCurrents()) === nothing

end # testset

