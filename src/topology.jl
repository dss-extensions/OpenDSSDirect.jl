module Topology

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Returns index of the active branch"""
function ActiveBranch()::Int
    return @checked Lib.Topology_Get_ActiveBranch()
end

"""Topological depth of the active branch"""
function ActiveLevel()::Int
    return @checked Lib.Topology_Get_ActiveLevel()
end

"""Array of all isolated branch names. (Getter)"""
function AllIsolatedBranches()::Vector{String}
    return get_string_array(Lib.Topology_Get_AllIsolatedBranches)
end

"""Array of all isolated load names. (Setter)"""
function AllIsolatedLoads()::Vector{String}
    return get_string_array(Lib.Topology_Get_AllIsolatedLoads)
end

"""Array of all looped element names, by pairs."""
function AllLoopedPairs()::Vector{String}
    return get_string_array(Lib.Topology_Get_AllLoopedPairs)
end

"""Move back toward the source, return index of new active branch, or 0 if no more."""
function BackwardBranch()::Int
    return @checked Lib.Topology_Get_BackwardBranch()
end

"""Name of the active branch."""
function BranchName()::String
    return get_string(@checked Lib.Topology_Get_BranchName())
end

"""Name of the active branch."""
function BranchName(Value::String)
    @checked Lib.Topology_Set_BranchName(Value)
end

"""Set the active branch to one containing this bus, return index or 0 if not found (Getter)"""
function BusName()::String
    return get_string(@checked Lib.Topology_Get_BusName())
end

"""Set the active branch to one containing this bus, return index or 0 if not found (Setter)"""
function BusName(Value::String)
    @checked Lib.Topology_Set_BusName(Value)
end

"""Sets the first branch active, returns 0 if none."""
function First()::Int
    return @checked Lib.Topology_Get_First()
end

"""First load at the active branch, return index or 0 if none."""
function FirstLoad()::Int
    return @checked Lib.Topology_Get_FirstLoad()
end

"""Move forward in the tree, return index of new active branch or 0 if no more"""
function ForwardBranch()::Int
    return @checked Lib.Topology_Get_ForwardBranch()
end

"""Move to looped branch, return index or 0 if none."""
function LoopedBranch()::Int
    return @checked Lib.Topology_Get_LoopedBranch()
end

"""Sets the next branch active, returns 0 if no more."""
function Next()::Int
    return @checked Lib.Topology_Get_Next()
end

"""Next load at the active branch, return index or 0 if no more."""
function NextLoad()::Int
    return @checked Lib.Topology_Get_NextLoad()
end

"""Number of isolated branches (PD elements and capacitors)."""
function NumIsolatedBranches()::Int
    return @checked Lib.Topology_Get_NumIsolatedBranches()
end

"""Number of isolated loads"""
function NumIsolatedLoads()::Int
    return @checked Lib.Topology_Get_NumIsolatedLoads()
end

"""Number of loops"""
function NumLoops()::Int
    return @checked Lib.Topology_Get_NumLoops()
end

"""Move to directly parallel branch, return index or 0 if none."""
function ParallelBranch()::Int
    return @checked Lib.Topology_Get_ParallelBranch()
end

end
