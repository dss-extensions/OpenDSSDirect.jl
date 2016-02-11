
using OpenDSSDirect.DSS

if !isdefined(Test, symbol("@testset"))
    if VERSION >= v"0.5-"
        using Base.Test
    else
        using BaseTestNext
        const Test = BaseTestNext
    end
end

init8500() = dss("""
    clear
    compile $(Pkg.dir())/OpenDSSDirect/examples/8500-Node/Master.dss
    solve
""")
