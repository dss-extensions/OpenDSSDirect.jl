
module OpenDSSDirect

__precompile__(true)

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

export dss

import Libdl

const path = @__DIR__
if Sys.iswindows()
    const LIBRARY = joinpath(path, "../deps/windows/dss_capi_v7.dll") |> abspath
    const KLUSOLVE_LIBRARY = joinpath(path, "../deps/windows/libklusolve.dll") |> abspath
elseif Sys.islinux()
    const LIBRARY = joinpath(path, "../deps/linux/libdss_capi_v7.so") |> abspath
    const KLUSOLVE_LIBRARY = joinpath(path, "../deps/linux/libklusolve.so") |> abspath
elseif Sys.isapple()
    const LIBRARY = joinpath(path, "../deps/apple/libdss_capi_v7.dylib") |> abspath
    const KLUSOLVE_LIBRARY = joinpath(path, "../deps/apple/libklusolve.dylib") |> abspath
else
    error("Unknown operating system. Cannot use OpenDSSDirect")
end

include("docstringextensions.jl")

include("CEnum.jl")

include("lib.jl")

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

include("repl.jl")
include("iterators.jl")

const dss = OpenDSSDirect.Text.Command
const Examples = Utils.Examples

function __init__()

    if Libdl.dlopen(KLUSOLVE_LIBRARY) == C_NULL
        error("$KLUSOLVE_LIBRARY cannot be opened. Please check 'deps/build.log' for more information.")
    end

    if Libdl.dlopen(LIBRARY) == C_NULL
        error("$LIBRARY cannot be opened. Please check 'deps/build.log' for more information.")
    end

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
