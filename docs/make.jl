using Documenter, OpenDSSDirect

# Build documentation.
# ====================

makedocs(
    # options
    modules = [
               OpenDSSDirect,
              ],
    doctest = false,
    clean = false,
    format = Documenter.HTML(),
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
        "Release notes" => "NEWS.md",
        "License" => "LICENSE.md"]
)

# Deploy built documentation from Travis.
# =======================================

deploydocs(
    # options
    target = "build",
    repo = "github.com/dss-extensions/OpenDSSDirect.jl.git"
)
