using Test

include("init.jl")

println(OpenDSSDirect.Basic.Version())

# We probably don't need to test this
# @test ODD.Lib.DSS_CAPI_VERSION == "0.13.0rc1"

include("lowlevel.jl")
include("basics.jl")

include("activeclass.jl")
include("bus.jl")
include("capacitors.jl")
include("capcontrols.jl")
include("circuit.jl")
include("cktelement.jl")
# TODO: include("ctrlqueue.jl")
include("element.jl")
include("error.jl")
include("executive.jl")
include("fuses.jl")
include("generators.jl")
include("isource.jl")
include("lines.jl")
include("linecodes.jl")
include("loads.jl")
include("loadshape.jl")
include("meters.jl")
include("monitors.jl")
# TODO: include("parser.jl")
include("pdelements.jl")
# TODO: include("progress.jl")
include("properties.jl")
include("pvsystems.jl")
include("reclosers.jl")
include("regcontrols.jl")
include("relays.jl")
# TODO: include("sensors.jl")
include("settings.jl")
include("solution.jl")
include("swtcontrols.jl")
include("topology.jl")
include("transformers.jl")
include("vsources.jl")
include("xycurves.jl")
include("ymatrix.jl")

include("ctx_threads.jl")

include("examples.jl")
