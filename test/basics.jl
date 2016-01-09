module X

using OpenDSSDirect
using Base.Test


filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss")

dss("""
    clear
    compile $filename
""")
loadnumber = DSS.loads(Val{:First})
@test DSS.loads(Val{:Name_get}) == "138236b0"
while loadnumber > 0
    DSS.loads(Val{:kW_set},50.)
    DSS.loads(Val{:kvar_set},20.)
    loadnumber = DSS.loads(Val{:Next})
end
@test DSS.loads(:Count) == 1177

end # module

module Y

using OpenDSSDirect.DSS
using Base.Test

filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss")

dss("""
    clear
    compile $filename
    solve
""")

loadnumber = loads(Val{:First})
@test loads(Val{:Name_get}) == "138236b0"
kWsum = 0.0
kvarsum = 0.0
while loadnumber > 0
    kWsum += loads(Val{:kW_get})
    kvarsum += loads(Val{:kvar_get})
    loadnumber = loads(Val{:Next})
end

linelosssum = 0.0im
linenumber = lines(Val{:First})
n = lines(Val{:Count})
linelosses = zeros(Complex128, n)
for i in 1:n
    linelosssum += cktelement(Val{:Losses})[1]
    linelosses[i] = cktelement(Val{:Losses})[1]
    linenumber = lines(Val{:Next})
end
@test_approx_eq_eps linelosssum.re circuit(:LineLosses).re * 1000  50

@test solution(:Mode_get) == 0

circuit(:Losses)
circuit(:SubstationLosses)
circuit(:LineLosses)
circuit(:TotalPower)
circuit(:AllElementLosses)
circuit(:AllBusNames)

end # module