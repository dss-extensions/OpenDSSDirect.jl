using OpenDSSDirect

const Start = 3; #starts OpenDSS
const First = 0; #Loads First
const Next = 1;  #Loads Next
const kW = 1;    #Loads kW write
const kvar = 5;  #Loads kvar write
const Count = 4; #Loads Count

filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss")

DSSCore.DSSPut_Command("clear")
DSSCore.DSSPut_Command("compile $filename")
function setloads()
    for i = 1:1000
        loadnumber = DSSCore.DSSLoads(First,0)
        while loadnumber > 0
            DSSCore.DSSLoadsF(kW,50.)
            DSSCore.DSSLoadsF(kvar,20.)
            loadnumber = DSSCore.DSSLoads(Next,0)
        end
    end
    return DSSCore.DSSLoads(Count,0)
end
@time count = setloads()

DSSCore.DSSPut_Command("solve")

DSSCore.CircuitI(0,1)

using OpenDSSDirect.DSS

dss("""
    clear
    compile $filename
""")
function setloads2()
    for i = 1:1000
        loadnumber = loads(Val{:First})
        while loadnumber > 0
            loads(Val{:kW_set},50.)
            loads(Val{:kvar_set},20.)
            loadnumber = loads(Val{:Next})
        end
    end
    return loads(:Count)
end
@time count = setloads2()

dss("solve")