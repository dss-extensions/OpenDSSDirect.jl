module OpenDSSDirect

include("basics.jl")
include("api.jl")

__init__() = dss(:Start)

end # module
