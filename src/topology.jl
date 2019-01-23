module Topology

    using ..lib
    using ..utils

    """(read-only) Returns index of the active branch"""
    function ActiveBranch()
        return lib.Topology_Get_ActiveBranch()
    end

    """(read-only) Topological depth of the active branch"""
    function ActiveLevel()
        return lib.Topology_Get_ActiveLevel()
    end

    """(read-only) Array of all isolated branch names."""
    function AllIsolatedBranches()
        return get_string_array(lib.Topology_Get_AllIsolatedBranches)
    end

    """(read-only) Array of all isolated load names."""
    function AllIsolatedLoads()
        return get_string_array(lib.Topology_Get_AllIsolatedLoads)
    end

    """(read-only) Array of all looped element names, by pairs."""
    function AllLoopedPairs()
        return get_string_array(lib.Topology_Get_AllLoopedPairs)
    end

    """(read-only) MOve back toward the source, return index of new active branch, or 0 if no more."""
    function BackwardBranch()
        return lib.Topology_Get_BackwardBranch()
    end

    """Name of the active branch."""
    function BranchName()
        return get_string(lib.Topology_Get_BranchName())
    end

    """Name of the active branch."""
    function BranchName(Value::String)
        lib.Topology_Set_BranchName(Value)
    end

    """Set the active branch to one containing this bus, return index or 0 if not found"""
    function BusName()
        return get_string(lib.Topology_Get_BusName())
    end

    """Set the active branch to one containing this bus, return index or 0 if not found"""
    function BusName(Value::String)
        lib.Topology_Set_BusName(Value)
    end

    """(read-only) Sets the first branch active, returns 0 if none."""
    function First()
        return lib.Topology_Get_First()
    end

    """(read-only) First load at the active branch, return index or 0 if none."""
    function FirstLoad()
        return lib.Topology_Get_FirstLoad()
    end

    """(read-only) Move forward in the tree, return index of new active branch or 0 if no more"""
    function ForwardBranch()
        return lib.Topology_Get_ForwardBranch()
    end

    """(read-only) Move to looped branch, return index or 0 if none."""
    function LoopedBranch()
        return lib.Topology_Get_LoopedBranch()
    end

    """(read-only) Sets the next branch active, returns 0 if no more."""
    function Next()
        return lib.Topology_Get_Next()
    end

    """(read-only) Next load at the active branch, return index or 0 if no more."""
    function NextLoad()
        return lib.Topology_Get_NextLoad()
    end

    """(read-only) Number of isolated branches (PD elements and capacitors)."""
    function NumIsolatedBranches()
        return lib.Topology_Get_NumIsolatedBranches()
    end

    """(read-only) Number of isolated loads"""
    function NumIsolatedLoads()
        return lib.Topology_Get_NumIsolatedLoads()
    end

    """(read-only) Number of loops"""
    function NumLoops()
        return lib.Topology_Get_NumLoops()
    end

    """(read-only) Move to directly parallel branch, return index or 0 if none."""
    function ParallelBranch()
        return lib.Topology_Get_ParallelBranch()
    end

end

