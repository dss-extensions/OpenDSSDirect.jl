module OpenDSSDirect

include("core.jl")
include("api.jl")

__init__() = dss(:Start)

end # module
