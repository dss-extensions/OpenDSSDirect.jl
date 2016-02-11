include("init.jl")
init8500()


@testset "topology" begin 

@test topology(:NumLoops) == 599
@test topology(:NumIsolatedBranches) == 5
@test topology(:NumIsolatedLoads) == 0
@test topology(:First) == 1
@test topology(:Next) == 1
@test topology(:ActiveBranch) == 1
@test topology(:ForwardBranch) == 1
@test topology(:BackwardBranch) == 1
@test topology(:LoopedBranch) == 0
@test topology(:ParallelBranch) == 0
@test topology(:FirstLoad) == 0
@test topology(:NextLoad) == 0
@test topology(:ActiveLevel) == 1
@test topology(:BranchName) == "Reactor.hvmv_sub_hsb"
@test topology(:BranchName, topology(:BranchName)) == ""
@test topology(:BusName) == "sourcebus"
@test topology(:BusName, topology(:BusName)) == ""
@test topology(:AllLoopedPairs)[end] == "Transformer.feeder_regc"
# @test topology(:AllIsolatedBranches)[end] == "Transformer.feeder_regc"
@test topology(:AllIsolatedLoads) == ["NONE"]

end # testset

