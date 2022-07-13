using OpenDSSDirect

filename = abspath(joinpath(@__DIR__, "../examples/8500-Node/Master.dss"))

OpenDSSDirect.Text.Command("clear")
OpenDSSDirect.Text.Command("redirect $filename")
function setloads()
    for i = 1:1000
        loadnumber = Loads.First()
        while loadnumber > 0
            Loads.kW(50.0)
            Loads.kvar(20.0)
            loadnumber = Loads.Next()
        end
    end
    return Loads.Count()
end
@time count_loads = setloads()

OpenDSSDirect.Text.Command("solve")

using OpenDSSDirect

dss("""
    clear
    redirect $filename
""")
function setloads2()
    for i = 1:1000
        loadnumber = Loads.First()
        while loadnumber > 0
            Loads.kW(50.)
            Loads.kvar(20.)
            loadnumber = Loads.Next()
        end
    end
    return Loads.Count()
end
@time count_loads = setloads2()

dss("solve")

nothing
