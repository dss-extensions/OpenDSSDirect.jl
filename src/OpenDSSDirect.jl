
module OpenDSSDirect

import Libdl

export LIBRARY

export ActiveClass
export Basic
export Bus
export CapControls
export Capacitors
export Circuit
export CktElement
export CtrlElement
export Element
export Error
export Executive
export Fuses
export Generators
export Isource
export LineCodes
export Lines
export Loads
export LoadShape
export Meters
export Monitors
export Parser
export PDElements
export Progress
export Properties
export PVsystems
export Reclosers
export RegControls
export Relays
export Sensors
export Settings
export Solution
export SwtControls
export Text
export Topology
export Transformers
export Vsources
export XYCurves
export YMatrix

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
include("parser.jl")
include("pdelements.jl")
include("progress.jl")
include("properties.jl")
include("pvsystems.jl")
include("reclosers.jl")
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


end # module
