using Documenter, OpenDSSDirect

# Build documentation.
# ====================

makedocs(
    # options
    modules = [OpenDSSDirect.DSS, OpenDSSDirect.DSSCore],
    doctest = false,
    clean   = false
)

# Deploy built documentation from Travis.
# =======================================

# Needs to install an additional dep, mkdocs-material, so provide a custom `deps`.
custom_deps() = run(`pip install --user pygments mkdocs mkdocs-material`)

deploydocs(
    # options
    deps = custom_deps,
    julia   = "release",
    repo = "github.com/tshort/OpenDSSDirect.jl.git"
)
