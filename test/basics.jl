module X

using OpenDSSDirect
using Test

const DSS = OpenDSSDirect

@testset "basicsX" begin

    filename = string("$(dirname(@__FILE__))/../examples/8500-Node/Master.dss" |> normpath)
    OpenDSSDirect.Text.Command("""
        clear
        redirect $filename
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

using OpenDSSDirect
using Test
const DSS = OpenDSSDirect

@testset "basicsY" begin

    filename = string("$(dirname(@__FILE__))/../examples/8500-Node/Master.dss")

    DSS.Text.Command("""
        clear
        redirect $filename
        solve
        """)

    loadnumber = DSS.Loads.First()
    @test DSS.Loads.Name() == "138236b0"
    kWsum = 0.0
    kvarsum = 0.0
    while loadnumber > 0
        kWsum += DSS.Loads.kW()
        kvarsum += DSS.Loads.kvar()
        loadnumber = DSS.Loads.Next()
    end

    linelosssum = 0.0im
    linenumber = DSS.Lines.First()
    n = DSS.Lines.Count()
    linelosses = zeros(ComplexF64, n)
    for i in 1:n
        linelosssum += DSS.CktElement.Losses()[1]
        linelosses[i] = DSS.CktElement.Losses()[1]
        linenumber = DSS.Lines.Next()
    end
    @test linelosssum.re ≈ (DSS.Circuit.LineLosses().re * 1000)  atol=50

    @test DSS.Solution.Mode() == 0

    DSS.Circuit.Losses()
    DSS.Circuit.SubstationLosses()
    DSS.Circuit.LineLosses()
    DSS.Circuit.TotalPower()
    DSS.Circuit.AllElementLosses()
    DSS.Circuit.AllBusNames()

end

end # module
