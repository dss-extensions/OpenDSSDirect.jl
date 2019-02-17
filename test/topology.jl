
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
@test Topology.BranchName(Topology.BranchName()) == nothing
@test Topology.BusName() == "sourcebus"
@test Topology.BusName(Topology.BusName()) == nothing
@test Topology.AllLoopedPairs()[end] == "Transformer.feeder_regc"
@test Topology.AllIsolatedBranches()[end] == "" # TODO: Why is this an empty string?
@test Topology.AllIsolatedBranches()[1] == "Line.wd701_48332_sw"
@test Topology.AllIsolatedLoads() == ["NONE"] # TODO: should this return empty array instead of ["NONE"]

arr = String[]
for i in OpenDSSDirect.EachMember(Topology); push!(arr, Topology.BusName()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Topology, Topology.BusName))
    @test n == arr[i]
end
@test_broken arr == Circuit.AllBusNames() # TODO: what is topology iterating?
@test length(arr) == length(Circuit.AllBusNames()) + 14
@test_throws UndefVarError length(arr) == length(OpenDSSDirect.EachMember(Topology)) # TODO: Topology does not have Count attribute

end # testset
