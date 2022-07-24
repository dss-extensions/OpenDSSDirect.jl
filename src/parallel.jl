module Parallel

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Creates a new DSS actor"""
function CreateActor()
    @checked Lib.Parallel_CreateActor()
end

"""Wait for the actors to finish the current actions"""
function Wait()
    @checked Lib.Parallel_Wait()
end

"""Gets the ID of the Active Actor"""
function ActiveActor()::Int
    return @checked Lib.Parallel_Get_ActiveActor()
end

"""Sets the ID of the Active Actor"""
function ActiveActor(Value::Int)
    @checked Lib.Parallel_Set_ActiveActor(Value)
end

"""Returns the state of the internal DSS parallel features"""
function ActiveParallel()::Int
    return @checked Lib.Parallel_Get_ActiveParallel()
end

"""Controls if the parallel features of the engine are active"""
function ActiveParallel(Value::Int)
    @checked Lib.Parallel_Set_ActiveParallel(Value)
end

"""Gets/sets the CPU of the Active Actor (Getter)"""
function ActorCPU()::Int
    return @checked Lib.Parallel_Get_ActorCPU()
end

"""Gets/sets the CPU of the Active Actor (Setter)"""
function ActorCPU(Value::Int)
    @checked Lib.Parallel_Set_ActorCPU(Value)
end

"""Gets the progress of all existing actors in pct"""
function ActorProgress()
    return get_int32_array(Lib.Parallel_Get_ActorProgress)
end

"""Gets the status of each actor"""
function ActorStatus()
    return get_int32_array(Lib.Parallel_Get_ActorStatus)
end

"""Controls the ConcatenateReports option (Getter)"""
function ConcatenateReports()::Bool
    return @checked(Lib.Parallel_Get_ConcatenateReports()) != 0
end

"""Controls the ConcatenateReports option (Setter)"""
function ConcatenateReports(Value::Bool)
    @checked Lib.Parallel_Set_ConcatenateReports(Value ? 1 : 0)
end

"""Delivers the number of CPUs on the current machine as recognized by the DSS engine"""
function NumCPUs()::Int
    return @checked Lib.Parallel_Get_NumCPUs()
end

"""Delivers the number of Cores of the local machine as recognized by the DSS engine"""
function NumCores()::Int
    return @checked Lib.Parallel_Get_NumCores()
end

"""Gets the number of Actors created"""
function NumOfActors()::Int
    return @checked Lib.Parallel_Get_NumOfActors()
end

end