using Documenter, OpenDSSDirect

# Build documentation.
# ====================

makedocs(
    # options
    modules = [OpenDSSDirect, ],
    doctest = false,
    clean = false,
    checkdocs=:exports,
    format = Documenter.HTML(
        size_threshold_warn = 250_000,
        size_threshold=500_000,
        sidebar_sitename = false
    ),
    sitename = "OpenDSSDirect.jl",
    authors = "Tom Short, Dheepak Krishnamurthy, Paulo Meira, OpenDSSDirect.jl contributors",
    pages = Any[
        "Home" => "index.md",
        "Documentation" => Any[
              "Main API" => [
                "api.md",
                "api/ActiveClass.md",
                "api/Basic.md",
                "api/Bus.md",
                "api/Capacitors.md",
                "api/CapControls.md",
                "api/Circuit.md",
                "api/CktElement.md",
                "api/CNData.md",
                "api/CtrlQueue.md",
                "api/Element.md",
                "api/Error.md",
                "api/Executive.md",
                "api/Fuses.md",
                "api/Generators.md",
                "api/GICSources.md",
                "api/Isource.md",
                "api/LineCodes.md",
                "api/LineGeometries.md",
                "api/Lines.md",
                "api/LineSpacings.md",
                "api/LoadShape.md",
                "api/Loads.md",
                "api/Meters.md",
                "api/Monitors.md",
                "api/Parallel.md",
                "api/Parser.md",
                "api/PDElements.md",
                "api/Progress.md",
                "api/Properties.md",
                "api/PVsystems.md",
                "api/Reactors.md",
                "api/Reclosers.md",
                "api/ReduceCkt.md",
                "api/RegControls.md",
                "api/Relays.md",
                "api/Sensors.md",
                "api/Settings.md",
                "api/Solution.md",
                "api/Storages.md",
                "api/SwtControls.md",
                "api/Text.md",
                "api/Topology.md",
                "api/Transformers.md",
                "api/TSData.md",
                "api/Vsources.md",
                "api/WindGens.md",
                "api/WireData.md",
                "api/XYCurves.md",
                "api/YMatrix.md",
                "api/ZIP.md",
              ],
              "Alt API" => [joinpath("api/altdss", fn) for fn in readdir(joinpath(@__DIR__, "src/api/altdss"))],
              "flags.md",
              "dssmode.md",
              "Low-level API" => "lowlevel.md",
              "engines.md",
              "docindex.md"],
        "Release notes" => "NEWS.md",
        "License" => "LICENSE.md"]
)

# Deploy built documentation from CI
# ==================================

deploydocs(
    # options
    target = "build",
    repo = "github.com/dss-extensions/OpenDSSDirect.jl.git"
)
