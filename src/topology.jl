module Topology

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Returns index of the active branch

Original COM help: https://opendss.epri.com/ActiveBranch.html
"""
function ActiveBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_ActiveBranch(dss.ctx)
end
ActiveBranch() = ActiveBranch(DSS_DEFAULT_CTX)

"""
Topological depth of the active branch

Original COM help: https://opendss.epri.com/ActiveLevel.html
"""
function ActiveLevel(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_ActiveLevel(dss.ctx)
end
ActiveLevel() = ActiveLevel(DSS_DEFAULT_CTX)

"""
Array of all isolated branch names.

Original COM help: https://opendss.epri.com/AllIsolatedBranches.html
"""
function AllIsolatedBranches(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Topology_Get_AllIsolatedBranches, dss.ctx)
end
AllIsolatedBranches() = AllIsolatedBranches(DSS_DEFAULT_CTX)

"""
Array of all isolated load names.

Original COM help: https://opendss.epri.com/AllIsolatedLoads.html
"""
function AllIsolatedLoads(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Topology_Get_AllIsolatedLoads, dss.ctx)
end
AllIsolatedLoads() = AllIsolatedLoads(DSS_DEFAULT_CTX)

"""
Array of all looped element names, by pairs.

Original COM help: https://opendss.epri.com/AllLoopedPairs.html
"""
function AllLoopedPairs(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Topology_Get_AllLoopedPairs, dss.ctx)
end
AllLoopedPairs() = AllLoopedPairs(DSS_DEFAULT_CTX)

"""
Move back toward the source, return index of new active branch, or 0 if no more.

Original COM help: https://opendss.epri.com/BackwardBranch.html
"""
function BackwardBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_BackwardBranch(dss.ctx)
end
BackwardBranch() = BackwardBranch(DSS_DEFAULT_CTX)

"""
Name of the active branch.

Original COM help: https://opendss.epri.com/BranchName.html

(Getter)
"""
function BranchName(dss::DSSContext)::String
    return get_string(@checked Lib.Topology_Get_BranchName(dss.ctx))
end
BranchName() = BranchName(DSS_DEFAULT_CTX)

"""
Name of the active branch.

Original COM help: https://opendss.epri.com/BranchName.html

(Setter)
"""
function BranchName(dss::DSSContext, Value::String)
    @checked Lib.Topology_Set_BranchName(dss.ctx, Value)
end
BranchName(Value::String) = BranchName(DSS_DEFAULT_CTX, Value)

"""
Set the active branch to one containing this bus, return index or 0 if not found

Original COM help: https://opendss.epri.com/BusName.html

(Getter)
"""
function BusName(dss::DSSContext)::String
    return get_string(@checked Lib.Topology_Get_BusName(dss.ctx))
end
BusName() = BusName(DSS_DEFAULT_CTX)

"""
Set the active branch to one containing this bus, return index or 0 if not found

Original COM help: https://opendss.epri.com/BusName.html

(Setter)
"""
function BusName(dss::DSSContext, Value::String)
    @checked Lib.Topology_Set_BusName(dss.ctx, Value)
end
BusName(Value::String) = BusName(DSS_DEFAULT_CTX, Value)

"""
Sets the first branch active, returns 0 if none.

Original COM help: https://opendss.epri.com/First19.html
"""
function First(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
First load at the active branch, return index or 0 if none.

Original COM help: https://opendss.epri.com/FirstLoad.html
"""
function FirstLoad(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_FirstLoad(dss.ctx)
end
FirstLoad() = FirstLoad(DSS_DEFAULT_CTX)

"""
Move forward in the tree, return index of new active branch or 0 if no more

Original COM help: https://opendss.epri.com/ForwardBranch.html
"""
function ForwardBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_ForwardBranch(dss.ctx)
end
ForwardBranch() = ForwardBranch(DSS_DEFAULT_CTX)

"""
Move to looped branch, return index or 0 if none.

Original COM help: https://opendss.epri.com/LoopedBranch.html
"""
function LoopedBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_LoopedBranch(dss.ctx)
end
LoopedBranch() = LoopedBranch(DSS_DEFAULT_CTX)

"""
Sets the next branch active, returns 0 if no more.

Original COM help: https://opendss.epri.com/Next18.html
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Next load at the active branch, return index or 0 if no more.

Original COM help: https://opendss.epri.com/NextLoad.html
"""
function NextLoad(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_NextLoad(dss.ctx)
end
NextLoad() = NextLoad(DSS_DEFAULT_CTX)

"""
Number of isolated branches (PD elements and capacitors).

Original COM help: https://opendss.epri.com/NumIsolatedBranches.html
"""
function NumIsolatedBranches(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_NumIsolatedBranches(dss.ctx)
end
NumIsolatedBranches() = NumIsolatedBranches(DSS_DEFAULT_CTX)

"""
Number of isolated loads

Original COM help: https://opendss.epri.com/NumIsolatedLoads.html
"""
function NumIsolatedLoads(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_NumIsolatedLoads(dss.ctx)
end
NumIsolatedLoads() = NumIsolatedLoads(DSS_DEFAULT_CTX)

"""
Number of loops

Original COM help: https://opendss.epri.com/NumLoops.html
"""
function NumLoops(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_NumLoops(dss.ctx)
end
NumLoops() = NumLoops(DSS_DEFAULT_CTX)

"""
Move to directly parallel branch, return index or 0 if none.

Original COM help: https://opendss.epri.com/ParallelBranch.html
"""
function ParallelBranch(dss::DSSContext)::Int
    return @checked Lib.Topology_Get_ParallelBranch(dss.ctx)
end
ParallelBranch() = ParallelBranch(DSS_DEFAULT_CTX)

end
