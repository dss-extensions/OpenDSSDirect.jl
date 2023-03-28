module Topology

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Returns index of the active branch"""
function ActiveBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_ActiveBranch(dss.ctx)
end
ActiveBranch() = ActiveBranch(DSS_DEFAULT_CTX)

"""Topological depth of the active branch"""
function ActiveLevel(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_ActiveLevel(dss.ctx)
end
ActiveLevel() = ActiveLevel(DSS_DEFAULT_CTX)

"""Array of all isolated branch names. (Getter)"""
function AllIsolatedBranches(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Topology_Get_AllIsolatedBranches, dss.ctx)
end
AllIsolatedBranches() = AllIsolatedBranches(DSS_DEFAULT_CTX)

"""Array of all isolated load names. (Setter)"""
function AllIsolatedLoads(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Topology_Get_AllIsolatedLoads, dss.ctx)
end
AllIsolatedLoads() = AllIsolatedLoads(DSS_DEFAULT_CTX)

"""Array of all looped element names, by pairs."""
function AllLoopedPairs(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Topology_Get_AllLoopedPairs, dss.ctx)
end
AllLoopedPairs() = AllLoopedPairs(DSS_DEFAULT_CTX)

"""Move back toward the source, return index of new active branch, or 0 if no more."""
function BackwardBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_BackwardBranch(dss.ctx)
end
BackwardBranch() = BackwardBranch(DSS_DEFAULT_CTX)

"""Name of the active branch."""
function BranchName(dss::DSSContext)::String
    return get_string(@checked Lib.Topology_Get_BranchName(dss.ctx))
end
BranchName() = BranchName(DSS_DEFAULT_CTX)

"""Name of the active branch."""
function BranchName(dss::DSSContext, Value::String)
    @checked Lib.Topology_Set_BranchName(dss.ctx, Value)
end
BranchName(Value::String) = BranchName(DSS_DEFAULT_CTX, Value)

"""Set the active branch to one containing this bus, return index or 0 if not found (Getter)"""
function BusName(dss::DSSContext)::String
    return get_string(@checked Lib.Topology_Get_BusName(dss.ctx))
end
BusName() = BusName(DSS_DEFAULT_CTX)

"""Set the active branch to one containing this bus, return index or 0 if not found (Setter)"""
function BusName(dss::DSSContext, Value::String)
    @checked Lib.Topology_Set_BusName(dss.ctx, Value)
end
BusName(Value::String) = BusName(DSS_DEFAULT_CTX, Value)

"""Sets the first branch active, returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""First load at the active branch, return index or 0 if none."""
function FirstLoad(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_FirstLoad(dss.ctx)
end
FirstLoad() = FirstLoad(DSS_DEFAULT_CTX)

"""Move forward in the tree, return index of new active branch or 0 if no more"""
function ForwardBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_ForwardBranch(dss.ctx)
end
ForwardBranch() = ForwardBranch(DSS_DEFAULT_CTX)

"""Move to looped branch, return index or 0 if none."""
function LoopedBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_LoopedBranch(dss.ctx)
end
LoopedBranch() = LoopedBranch(DSS_DEFAULT_CTX)

"""Sets the next branch active, returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Next load at the active branch, return index or 0 if no more."""
function NextLoad(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_NextLoad(dss.ctx)
end
NextLoad() = NextLoad(DSS_DEFAULT_CTX)

"""Number of isolated branches (PD elements and capacitors)."""
function NumIsolatedBranches(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_NumIsolatedBranches(dss.ctx)
end
NumIsolatedBranches() = NumIsolatedBranches(DSS_DEFAULT_CTX)

"""Number of isolated loads"""
function NumIsolatedLoads(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_NumIsolatedLoads(dss.ctx)
end
NumIsolatedLoads() = NumIsolatedLoads(DSS_DEFAULT_CTX)

"""Number of loops"""
function NumLoops(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_NumLoops(dss.ctx)
end
NumLoops() = NumLoops(DSS_DEFAULT_CTX)

"""Move to directly parallel branch, return index or 0 if none."""
function ParallelBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_ParallelBranch(dss.ctx)
end
ParallelBranch() = ParallelBranch(DSS_DEFAULT_CTX)

end
