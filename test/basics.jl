module X

using OpenDSSDirect
using Test

@testset "basicsX" begin

    filename = string("$(dirname(@__FILE__))/../examples/8500-Node/Master.dss")

    dss("""
        clear
        compile $filename
    """)
    loadnumber = DSS.Loads.First()
    @test DSS.Loads.Name() == "138236b0"
    while loadnumber > 0
        DSS.Loads.kW(50.)
        DSS.Loads.kvar(20.)
        loadnumber = DSS.Loads.Next()
    end
    @test DSS.Loads.Count() == 1177

end

end # module

module Y

using OpenDSSDirect.DSS
using Test

@testset "basicsY" begin

    filename = string("$(dirname(@__FILE__))/../examples/8500-Node/Master.dss")


    dss("""
        clear
        compile $filename
        solve
    """)

    loadnumber = Loads.First()
    @test Loads.Name() == "138236b0"
    kWsum = 0.0
    kvarsum = 0.0
    while loadnumber > 0
        kWsum += Loads.kW()
        kvarsum += Loads.kvar()
        loadnumber = Loads.Next()
    end

    linelosssum = 0.0im
    linenumber = Lines.First()
    n = Lines.Count()
    linelosses = zeros(ComplexF64, n)
    for i in 1:n
        linelosssum += CktElement.Losses()[1]
        linelosses[i] = CktElement.Losses()[1]
        linenumber = Lines.Next()
    end
    @test linelosssum.re ≈ (Circuit.LineLosses().re * 1000)  atol=50

    @test Solution.Mode() == 0

    Circuit.Losses()
    Circuit.SubstationLosses()
    Circuit.LineLosses()
    Circuit.TotalPower()
    Circuit.AllElementLosses()
    Circuit.AllBusNames()

end

end # module
