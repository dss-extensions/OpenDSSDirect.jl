module bench

using ..Executive
import Libdl
import ..Lib
using ..Utils

function run_bench()
    if Libdl.dlopen(LOADER_LIBRARY) == C_NULL
        error("$LOADER_LIBRARY cannot be opened.")
    end

    local funcs = AltDSSCAPI()
    rfuncs = Ref(funcs)
    @assert AltDSSCAPILibInit(ALTDSS_LIBRARY, "", rfuncs) == 1

    ctx = dss_ccall(funcs.ctx_Get_Prime)
    dss_ccall(funcs.DSS_Get_Version, ctx)

    # println(unsafe_string(dss_ccall(funcs.DSS_Get_Version, ctx)))
    
    # println(dss_ccall(funcs.DSS_Executive_Get_NumCommands, ctx))

    # println(@benchmark unsafe_string(dss_ccall(funcs.DSS_Get_Version, ctx)))
    x = 0
    t = @elapsed begin
        for n=1:10000000
            x += dss_ccall(funcs.DSS_Executive_Get_NumCommands, ctx)
        end
    end
    println("dss_ccall: ", t)
    
    f = funcs.DSS_Executive_Get_NumCommands.cfunc
    x = 0
    t = @elapsed begin
        for n=1:10000000
            x += ccall(f, Int32, (Ptr{Cvoid},), ctx)
        end
    end
    println("direct ccall", t)


    # println(@benchmark OpenDSSDirect.DSS.Version())
    x = 0
    t = @elapsed begin
        for n=1:10000000
            x += Executive.NumCommands()
        end
    end
    println("compiled ccall", t)

    # println(@benchmark OpenDSSDirect.DSS.Version())
    x = 0
    t = @elapsed begin
        for n=1:10000000
            x += dss_ccall(DSS_DEFAULT_CTX.capi.DSS_Executive_Get_NumCommands, DSS_DEFAULT_CTX.ctx)
        end
    end
    println("compiled ccall (Lib.)", t)


    # println(@benchmark unsafe_string(dss_ccall(funcs.DSS_Get_Version, ctx)))
    # println(@benchmark dss_ccall(funcs.DSS_Executive_Get_NumCommands, ctx))
    # f = funcs.DSS_Executive_Get_NumCommands.cfunc
    # println(@benchmark ccall(f, Int32, (Ptr{Cvoid},), ctx))


    LIB =  Libdl.dlopen(ALTDSS_LIBRARY)
    sym = Libdl.dlsym(LIB, :ctx_DSS_Executive_Get_NumCommands)
    x = 0
    t = @elapsed begin
        for n=1:10000000
            x += ccall(sym, Int32, (Ptr{Cvoid},), ctx)
        end
    end
    println("dlsym ccall", t)
end

end