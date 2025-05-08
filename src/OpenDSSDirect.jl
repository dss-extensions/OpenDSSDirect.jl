
module OpenDSSDirect

export ActiveClass 
export Basic
export DSS
export Bus 
export Capacitors 
export CapControls 
export Circuit 
export CktElement 
export CNData 
export CtrlQueue 
export Element 
export Error 
export Executive 
export Fuses 
export Generators 
export GICSources 
export Isource 
export LineCodes 
export LineGeometries 
export Lines 
export LineSpacings 
export Loads 
export LoadShape 
export Meters 
export Monitors 
export Parallel 
export Parser 
export PDElements 
export Progress 
export Properties 
export PVsystems 
export Reactors 
export Reclosers 
export ReduceCkt 
export RegControls 
export Relays 
export Sensors 
export Settings 
export Solution 
export Storages 
export SwtControls 
export Text 
export Topology 
export TSData 
export Transformers 
export Vsources 
export WindGens
export WireData 
export XYCurves 
export YMatrix 
export ZIP
export DSSContext

export dss

export DSS_DEFAULT_STRUCT

import Libdl

if get(ENV, "DSS_EXTENSIONS_DEBUG", "0") == "1"
    LIBRARY_SUFFIX = "d"
    @warn "Environment variable DSS_EXTENSIONS_DEBUG=1 is set: loading the debug version of AltDSS engine library for the default context"
else
    LIBRARY_SUFFIX = ""
end

if Sys.iswindows()
    const LIBRARY = abspath(joinpath(@__DIR__, "../deps/windows/altdss_capi$(LIBRARY_SUFFIX).dll"))
    const KLUSOLVE_LIBRARY = abspath(joinpath(@__DIR__, "../deps/windows/libklusolvex.dll"))
elseif Sys.islinux()
    const LIBRARY = abspath(joinpath(@__DIR__, "../deps/linux/libaltdss_capi$(LIBRARY_SUFFIX).so"))
    const KLUSOLVE_LIBRARY = abspath(joinpath(@__DIR__, "../deps/linux/libklusolvex.so"))
elseif Sys.isapple()
    const LIBRARY = abspath(joinpath(@__DIR__, "../deps/apple/libaltdss_capi$(LIBRARY_SUFFIX).dylib"))
    const KLUSOLVE_LIBRARY = abspath(joinpath(@__DIR__, "../deps/apple/libklusolvex.dylib"))
else
    error("Unknown operating system. Cannot use OpenDSSDirect")
end

module Lib

    using CEnum

    import ..OpenDSSDirect: LIBRARY

    const DSS_CAPI_VERSION = "0.15.0"

    include("common.jl")
    include("extensions.jl")
    include("capi.jl")
end

using .Lib

mutable struct DSSContext
    ctx::Ptr{Cvoid}
    const capi::AltDSSCAPI
    error::Ptr{Int32}
end

DSS_DEFAULT_STRUCT = AltDSSCAPI()

include("utils.jl")

include("activeclass.jl")
include("basic.jl")
include("bus.jl")
include("cap_controls.jl")
include("capacitors.jl")
include("circuit.jl")
include("ckt_element.jl")
include("ctrl_queue.jl")
include("element.jl")
include("error.jl")
include("executive.jl")
include("fuses.jl")
include("generators.jl")
include("isource.jl")
include("linecodes.jl")
include("lines.jl")
include("loads.jl")
include("loadshape.jl")
include("meters.jl")
include("monitors.jl")
include("parallel.jl")
include("parser.jl")
include("pdelements.jl")
include("progress.jl")
include("properties.jl")
include("pvsystems.jl")
include("reclosers.jl")
include("reduce_ckt.jl")
include("reg_controls.jl")
include("relays.jl")
include("sensors.jl")
include("settings.jl")
include("solution.jl")
include("swt_controls.jl")
include("text.jl")
include("topology.jl")
include("transformers.jl")
include("vsources.jl")
include("xycurves.jl")
include("ymatrix.jl")
include("zip.jl")
include("storages.jl")
include("cndata.jl")
include("gicsources.jl")
include("linegeometries.jl")
include("linespacings.jl")
include("reactors.jl")
include("tsdata.jl")
include("wiredata.jl")
include("windgens.jl")

include("repl.jl")
include("iterators.jl")

include("bench.jl")

const dss = OpenDSSDirect.Text.Command

using .Utils

"""
Load an EPRI OpenDSS library, returning its context

EPRI's OpenDSS distribution or OpenDSS-C can be loaded, as well as
any library that implements its direct API (aka OpenDSSDirect.DLL, aka DCSL).

The library is loaded through AltDSS Oddie, a compatibility and extension library.
This allows projects on DSS-Extensions to use EPRI's distribution without sacrificing
the maintainance or performance when using our own AltDSS engine.

`DSS.Start` is automatically called.

**(API Extension)**
"""
function LoadOpenDSSLib(libpath::String)::DSSContext
    capi = AltDSSCAPI()
    # First, load Oddie
    loaded_status = AltDSSCAPILibInit(ODDIE_LIBRARY, "AltDSSOddieCAPIInit", Ref(capi))
    if loaded_status != 1
        error("Oddie could not be loaded (error $loaded_status)!")
    end
    finalizer(Utils.finalize_capi, capi)

    # Now load the target library
    dss_ccall(capi.Oddie_SetLibOptions, libpath, C_NULL)

    # Create the context    
    new_ctx = dss_ccall(capi.ctx_New)
    if new_ctx == C_NULL
        error("The OpenDSS library could not be loaded!")
    end

    # Always start to avoid issues with OpenDSS-C, or potentially threads in AltDSS
    dss_ccall(capi.DSS_Start, new_ctx, 0)

    error_ptr = dss_ccall(capi.Error_Get_NumberPtr, new_ctx)
    wrapped_ctx = DSSContext(new_ctx, capi, error_ptr)
    finalizer(Utils.finalize_ctx, wrapped_ctx)

    return wrapped_ctx
end
#TODO: provide a default lib here? LoadOpenDSSLib() = LoadOpenDSSLib(OPENDSSC_LIBRARY)

"""
Load an AltDSS library, returning its prime DSS context

*AltDSS is the official implementation on DSS-Extensions since 2018, previously
known as DSS C-API.*

Useful for loading different builds that are compatible. For example, users can
load the debug version of the library to investigate issues.

**(API Extension)**
"""
function LoadAltDSSLib(libpath::String)::DSSContext
    capi = AltDSSCAPI()
    # First, load Oddie
    loaded_status = AltDSSCAPILibInit(libpath, "", Ref(capi))
    if loaded_status != 1
        error("The target library could not be loaded (error $loaded_status)!")
    end
    finalizer(Utils.finalize_capi, capi)

    # Get the prime context    
    prime_ctx = dss_ccall(capi.ctx_Get_Prime)
    if prime_ctx == C_NULL
        error("The AltDSS context not be read!")
    end

    # Always start to avoid issues with OpenDSS-C, or potentially threads in AltDSS
    dss_ccall(capi.DSS_Start, prime_ctx, 0)

    error_ptr = dss_ccall(capi.Error_Get_NumberPtr, prime_ctx)
    wrapped_ctx = DSSContext(prime_ctx, capi, error_ptr)
    finalizer(Utils.finalize_ctx, wrapped_ctx)

    return wrapped_ctx
end

function __init__()
    global DSS_DEFAULT_STRUCT

    if Libdl.dlopen(LOADER_LIBRARY) == C_NULL
        error("$(LOADER_LIBRARY) cannot be opened. Please check 'deps/build.log' for more information.")
    end

    rfuncs = Ref(DSS_DEFAULT_STRUCT)

    loaded_status = AltDSSCAPILibInit(LIBRARY, "", rfuncs)
    if loaded_status != 1
        error("DSS engine could not be loaded (error $loaded_status)!")
    end
    finalizer(Utils.finalize_capi, DSS_DEFAULT_STRUCT)

    # if Libdl.dlopen(KLUSOLVE_LIBRARY) == C_NULL
    #     error("$KLUSOLVE_LIBRARY cannot be opened. Please check 'deps/build.log' for more information.")
    # end

    # if Libdl.dlopen(LIBRARY) == C_NULL
    #     error("$LIBRARY cannot be opened. Please check 'deps/build.log' for more information.")
    # end

    # Load the default descriptions/help strings
    dss_ccall(DSS_DEFAULT_STRUCT.DSS_SetPropertiesMO, abspath(joinpath(@__DIR__, "../deps/messages/properties-en-US.mo")))

    # Always start to avoid issues with OpenDSS-C, or potentially threads in AltDSS
    dss_ccall(DSS_DEFAULT_STRUCT.DSS_Start, C_NULL, 0)

    finalizer(Utils.finalize_ctx, DSS_DEFAULT_CTX)

    DSS_DEFAULT_CTX.error = dss_ccall(DSS_DEFAULT_STRUCT.Error_Get_NumberPtr, C_NULL)

    if !Sys.islinux()
        global commandhelp = Dict{String, String}()
        for i in 1:OpenDSSDirect.Executive.NumCommands()
            commandhelp[lowercase(OpenDSSDirect.Executive.Command(i))] = OpenDSSDirect.Executive.CommandHelp(i)
        end
        global optionhelp = Dict{String, String}()
        for i in 1:OpenDSSDirect.Executive.NumOptions()
            optionhelp[lowercase(OpenDSSDirect.Executive.Option(i))] = OpenDSSDirect.Executive.OptionHelp(i)
        end

        if !("OPENDSSDIRECT_REPL" in keys(ENV) && ENV["OPENDSSDIRECT_REPL"] == "false")
            if isdefined(Base, :active_repl)
                OpenDSSDirect.Repl.run_dss_repl()
            end
        end
    end

end


end # module
