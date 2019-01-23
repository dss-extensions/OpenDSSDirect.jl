
module OpenDSSDirect

import Libdl

export LIBRARY

const path = @__DIR__
const path = @__DIR__
if Sys.iswindows()
    const LIBRARY = joinpath(path, "../deps/win64/dss_capi_v7.dll") |> normpath
elseif Sys.islinux()
    const LIBRARY = joinpath(path, "../deps/linux/libdss_capi_v7.so")
else
    const LIBRARY = joinpath(path, "../deps/apple/libdss_capi_v7.dylib")
end

function __init__()

    if Sys.iswindows()
        KLUSOLVE_LIBRARY = joinpath(path, "../deps/win64/libklusolve.dll") |> normpath
        if Libdl.dlopen(KLUSOLVE_LIBRARY) == C_NULL
            error("\$$KLUSOLVE_LIBRARY cannot be opened")
        end
    end

    if Libdl.dlopen(LIBRARY) == C_NULL
        error("\$$LIBRARY cannot be opened")
    end

end

include("CEnum.jl")

include("dss.jl")

include("utils.jl")

include("activeclass.jl")
include("basic.jl")
include("bus.jl")
include("cap_controls.jl")
include("capacitors.jl")
include("circuit.jl")
include("text.jl")


end # module
