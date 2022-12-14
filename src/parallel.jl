module Parallel

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Creates a new DSS actor"""
function CreateActor(dss::DSSContext)
    @checked Lib.Parallel_CreateActor(dss.ctx)
end
CreateActor() = CreateActor(DSS_DEFAULT_CTX)

"""Wait for the actors to finish the current actions"""
function Wait(dss::DSSContext)
    @checked Lib.Parallel_Wait(dss.ctx)
end
Wait() = Wait(DSS_DEFAULT_CTX)

"""Gets the ID of the Active Actor"""
function ActiveActor(dss::DSSContext)::Int
    return @checked Lib.Parallel_Get_ActiveActor(dss.ctx)
end
ActiveActor() = ActiveActor(DSS_DEFAULT_CTX)

"""Sets the ID of the Active Actor"""
function ActiveActor(dss::DSSContext, Value::Int)
    @checked Lib.Parallel_Set_ActiveActor(dss.ctx, Value)
end
ActiveActor(Value::Int) = ActiveActor(DSS_DEFAULT_CTX, Value)

"""Returns the state of the internal DSS parallel features"""
function ActiveParallel(dss::DSSContext)::Int
    return @checked Lib.Parallel_Get_ActiveParallel(dss.ctx)
end
ActiveParallel() = ActiveParallel(DSS_DEFAULT_CTX)

"""Controls if the parallel features of the engine are active"""
function ActiveParallel(dss::DSSContext, Value::Int)
    @checked Lib.Parallel_Set_ActiveParallel(dss.ctx, Value)
end
ActiveParallel(Value::Int) = ActiveParallel(DSS_DEFAULT_CTX, Value)

"""Gets/sets the CPU of the Active Actor (Getter)"""
function ActorCPU(dss::DSSContext)::Int
    return @checked Lib.Parallel_Get_ActorCPU(dss.ctx)
end
ActorCPU() = ActorCPU(DSS_DEFAULT_CTX)

"""Gets/sets the CPU of the Active Actor (Setter)"""
function ActorCPU(dss::DSSContext, Value::Int)
    @checked Lib.Parallel_Set_ActorCPU(dss.ctx, Value)
end
ActorCPU(Value::Int) = ActorCPU(DSS_DEFAULT_CTX, Value)

"""Gets the progress of all existing actors in pct"""
function ActorProgress(dss::DSSContext)
    return get_int32_array(Lib.Parallel_Get_ActorProgress, dss.ctx)
end
ActorProgress() = ActorProgress(DSS_DEFAULT_CTX)

"""Gets the status of each actor"""
function ActorStatus(dss::DSSContext)
    return get_int32_array(Lib.Parallel_Get_ActorStatus, dss.ctx)
end
ActorStatus() = ActorStatus(DSS_DEFAULT_CTX)

"""Controls the ConcatenateReports option (Getter)"""
function ConcatenateReports(dss::DSSContext)::Bool
    return @checked(Lib.Parallel_Get_ConcatenateReports(dss.ctx)) != 0
end
ConcatenateReports() = ConcatenateReports(DSS_DEFAULT_CTX)

"""Controls the ConcatenateReports option (Setter)"""
function ConcatenateReports(dss::DSSContext, Value::Bool)
    @checked Lib.Parallel_Set_ConcatenateReports(dss.ctx, Value ? 1 : 0)
end
ConcatenateReports(Value::Bool) = ConcatenateReports(DSS_DEFAULT_CTX, Value)

"""Delivers the number of CPUs on the current machine as recognized by the DSS engine"""
function NumCPUs(dss::DSSContext)::Int
    return @checked Lib.Parallel_Get_NumCPUs(dss.ctx)
end
NumCPUs() = NumCPUs(DSS_DEFAULT_CTX)

"""Delivers the number of Cores of the local machine as recognized by the DSS engine"""
function NumCores(dss::DSSContext)::Int
    return @checked Lib.Parallel_Get_NumCores(dss.ctx)
end
NumCores() = NumCores(DSS_DEFAULT_CTX)

"""Gets the number of Actors created"""
function NumOfActors(dss::DSSContext)::Int
    return @checked Lib.Parallel_Get_NumOfActors(dss.ctx)
end
NumOfActors() = NumOfActors(DSS_DEFAULT_CTX)

end