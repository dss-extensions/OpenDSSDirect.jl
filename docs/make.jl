using Documenter, OpenDSSDirect

# Build documentation.
# ====================

makedocs(
    # options
    modules = [OpenDSSDirect.DSS, OpenDSSDirect.DSSCore],
    doctest = false,
    clean = false,
    format = :html,
    sitename = "OpenDSSDirect.jl",
    authors = "Tom Short",
    pages = Any[
        "Home" => "index.md",
        "Documentation" => Any[
              "Main API" => "api.md",
              "flags.md",
              "dssmode.md",
              "Low-level API" => "lowlevel.md",
              "docindex.md"],
        "Release notes" => "../../NEWS.md",
        "License" => "../../LICENSE.md"]
)

# Deploy built documentation from Travis.
# =======================================

deploydocs(
    # options
    deps = nothing,
    make = nothing,
    target = "build",
    # julia   = "release",
    repo = "github.com/tshort/OpenDSSDirect.jl.git"
)
