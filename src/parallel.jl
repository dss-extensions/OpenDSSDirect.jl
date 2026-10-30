module Parallel

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Create a new actor, if there are still cores available."""
function CreateActor(dss::DSSContext)
    @checked dss_ccall(dss.capi.Parallel_CreateActor, dss.ctx)
end
CreateActor() = CreateActor(DSS_DEFAULT_CTX)

"""
Suspends the host's thread until all the OpenDSS running jobs finish.

Original COM help: <https://opendss.epri.com/Wait.html>
"""
function Wait(dss::DSSContext)
    @checked dss_ccall(dss.capi.Parallel_Wait, dss.ctx)
end
Wait() = Wait(DSS_DEFAULT_CTX)

"""
Gets/sets the ID of the Active Actor

Original COM help: <https://opendss.epri.com/ActiveActor.html>

(Getter)
"""
function ActiveActor(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Parallel_Get_ActiveActor, dss.ctx)
end
ActiveActor() = ActiveActor(DSS_DEFAULT_CTX)

"""
Gets/sets the ID of the Active Actor

Original COM help: <https://opendss.epri.com/ActiveActor.html>

(Setter)
"""
function ActiveActor(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Parallel_Set_ActiveActor, dss.ctx, Value)
end
ActiveActor(Value::Int) = ActiveActor(DSS_DEFAULT_CTX, Value)

"""
(read) Sets ON/OFF (1/0) Parallel features of the Engine
(write) Delivers if the Parallel features of the Engine are Active

Original COM help: <https://opendss.epri.com/ActiveParallel.html>

(Getter)
"""
function ActiveParallel(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Parallel_Get_ActiveParallel, dss.ctx)
end
ActiveParallel() = ActiveParallel(DSS_DEFAULT_CTX)

"""
(read) Sets ON/OFF (1/0) Parallel features of the Engine
(write) Delivers if the Parallel features of the Engine are Active

Original COM help: <https://opendss.epri.com/ActiveParallel.html>

(Setter)
"""
function ActiveParallel(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Parallel_Set_ActiveParallel, dss.ctx, Value)
end
ActiveParallel(Value::Int) = ActiveParallel(DSS_DEFAULT_CTX, Value)

"""
Gets/sets the CPU of the Active Actor

Original COM help: <https://opendss.epri.com/ActorCPU.html>

(Getter)
"""
function ActorCPU(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Parallel_Get_ActorCPU, dss.ctx)
end
ActorCPU() = ActorCPU(DSS_DEFAULT_CTX)

"""
Gets/sets the CPU of the Active Actor

Original COM help: <https://opendss.epri.com/ActorCPU.html>

(Setter)
"""
function ActorCPU(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Parallel_Set_ActorCPU, dss.ctx, Value)
end
ActorCPU(Value::Int) = ActorCPU(DSS_DEFAULT_CTX, Value)

"""
Gets the progress of all existing actors in pct

Original COM help: <https://opendss.epri.com/ActorProgress.html>
"""
function ActorProgress(dss::DSSContext)
    return get_int32_array(dss.capi.Parallel_Get_ActorProgress, dss)
end
ActorProgress() = ActorProgress(DSS_DEFAULT_CTX)

"""
Gets the status of each actor

Original COM help: <https://opendss.epri.com/ActorStatus.html>
"""
function ActorStatus(dss::DSSContext)::Vector{Int}
    return get_int32_array(dss.capi.Parallel_Get_ActorStatus, dss)
end
ActorStatus() = ActorStatus(DSS_DEFAULT_CTX)

"""
(read) Reads the values of the ConcatenateReports option (1=enabled, 0=disabled)
(write) Enable/Disable (1/0) the ConcatenateReports option for extracting monitors data

Original COM help: <https://opendss.epri.com/ConcatenateReports.html>

(Getter)
"""
function ConcatenateReports(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Parallel_Get_ConcatenateReports, dss.ctx)) != 0
end
ConcatenateReports() = ConcatenateReports(DSS_DEFAULT_CTX)

"""
(read) Reads the values of the ConcatenateReports option (1=enabled, 0=disabled)
(write) Enable/Disable (1/0) the ConcatenateReports option for extracting monitors data

Original COM help: <https://opendss.epri.com/ConcatenateReports.html>

(Setter)
"""
function ConcatenateReports(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Parallel_Set_ConcatenateReports, dss.ctx, Value ? 1 : 0)
end
ConcatenateReports(Value::Bool) = ConcatenateReports(DSS_DEFAULT_CTX, Value)

"""
Delivers the number of CPUs on the current machine as recognized by the DSS engine

Original COM help: <https://opendss.epri.com/NumCPUs.html>
"""
function NumCPUs(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Parallel_Get_NumCPUs, dss.ctx)
end
NumCPUs() = NumCPUs(DSS_DEFAULT_CTX)

"""
Delivers the number of Cores of the local machine as recognized by the DSS engine

Original COM help: <https://opendss.epri.com/NumCores.html>
"""
function NumCores(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Parallel_Get_NumCores, dss.ctx)
end
NumCores() = NumCores(DSS_DEFAULT_CTX)

"""
Gets the number of Actors created

Original COM help: <https://opendss.epri.com/NumOfActors.html>
"""
function NumOfActors(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Parallel_Get_NumOfActors, dss.ctx)
end
NumOfActors() = NumOfActors(DSS_DEFAULT_CTX)

end
