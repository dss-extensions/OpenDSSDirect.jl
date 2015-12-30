using OpenDSSDirect
using Base.Test

const Start = 3; #starts OpenDSS
const First = 0; #Loads First
const Next = 1;  #Loads Next
const kW = 1;    #Loads kW write
const kvar = 5;  #Loads kvar write
const Count = 4; #Loads Count

DSS.DSSPut_Command("clear")
DSS.DSSPut_Command("compile (C:/PortableApps/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss)")
function setloads()
    for i = 1:1000
        loadnumber = DSS.DSSLoads(First,0)
        while loadnumber > 0
            DSS.DSSLoadsF(kW,50.)
            DSS.DSSLoadsF(kvar,20.)
            loadnumber = DSS.DSSLoads(Next,0)
        end
    end
    return DSS.DSSLoads(Count,0)
end
@time count = setloads()

DSS.DSSPut_Command("solve")

DSS.CircuitI(0,1)

dss("""
    clear
    compile (C:/PortableApps/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss)
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

