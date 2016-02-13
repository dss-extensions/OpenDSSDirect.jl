include("init.jl")
init8500()


@testset "Topology" begin 

@test Topology.NumLoops() == 599
@test Topology.NumIsolatedBranches() == 5
@test Topology.NumIsolatedLoads() == 0
@test Topology.First() == 1
@test Topology.Next() == 1
@test Topology.ActiveBranch() == 1
@test Topology.ForwardBranch() == 1
@test Topology.BackwardBranch() == 1
@test Topology.LoopedBranch() == 0
@test Topology.ParallelBranch() == 0
@test Topology.FirstLoad() == 0
@test Topology.NextLoad() == 0
@test Topology.ActiveLevel() == 1
@test Topology.BranchName() == "Reactor.hvmv_sub_hsb"
@test Topology.BranchName(Topology.BranchName()) == ""
@test Topology.BusName() == "sourcebus"
@test Topology.BusName(Topology.BusName()) == ""
@test Topology.AllLoopedPairs()[end] == "Transformer.feeder_regc"
# @test Topology.AllIsolatedBranches()[end] == "Transformer.feeder_regc"
@test Topology.AllIsolatedLoads() == ["NONE"]

end # testset

