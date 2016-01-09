module OpenDSSDirect

include("core.jl")
include("api.jl")

import .DSS.dss
export dss


__init__() = dss(:Start)

end # module
