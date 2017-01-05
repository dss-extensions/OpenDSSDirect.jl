
using OpenDSSDirect.DSS

if VERSION >= v"0.5-"
    using Base.Test
elseif !isdefined(Test, Symbol("@testset"))
    using BaseTestNext
    const Test = BaseTestNext
end

init8500() = dss("""
    clear
    compile $(dirname(@__FILE__))/../examples/8500-Node/Master.dss
    solve
""")

≋(x,y) = isapprox(x,y,rtol=0.000001)
