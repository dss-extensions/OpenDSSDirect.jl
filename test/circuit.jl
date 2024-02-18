
init8500()


@testset "Circuit" begin

@test Circuit.NumCktElements() == 6103
@test Circuit.NumBuses() == 4876
@test Circuit.NumNodes() == 8541
@test Circuit.FirstPCElement() == 1
@test Circuit.NextPCElement() == 2
@test Circuit.FirstPDElement() == 1
@test Circuit.NextPDElement() == 2
@test Circuit.Sample() === nothing
@test Circuit.SaveSample() === nothing
@test Circuit.SetActiveBusi(2) == 0
@test Circuit.FirstElement() == 1
@test Circuit.NextElement() == 2
@test Circuit.UpdateStorage() === nothing
@test Circuit.ParentPDElement() == 0
@test Circuit.EndOfTimeStepUpdate() === nothing
# @test Circuit.Capacity(10.0, 20.0) ≋ 0.0    # ERROR - Form popup related to energy meter
@test Circuit.Name() == "ieee8500"
@test Circuit.Disable(Circuit.AllElementNames()[10]) === nothing
@test Circuit.Enable(Circuit.AllElementNames()[10]) === nothing
@test Circuit.SetActiveElement(Circuit.AllElementNames()[10]) == 9
@test Circuit.SetActiveBus(Circuit.AllBusNames()[10]) == 9
@test Circuit.SetActiveClass(ActiveClass.ActiveClassName()) == 15
@test Circuit.Losses() ≋ 1.218242333223247e6 + 2.798391857088721e6im
@test Circuit.LineLosses() ≋ 1042.0872998508387 + 1674.1606828559168im
@test Circuit.SubstationLosses() ≋ 65.18947074155649 + 752.3006305284744im
@test Circuit.TotalPower() ≋ -12004.740450109337 - 1471.1749507157301im
@test Circuit.AllBusVolts()[end] ≋ -85.01962676301814 + 84.47523352214344im
@test Circuit.AllBusVMag()[end] ≋ 119.85158327508088
@test Circuit.AllElementNames()[end] == "RegControl.vreg4_c"
@test Circuit.AllBusNames()[end] == "sx3784018a"
@test Circuit.AllElementLosses()[end] ≋ 0.0
@test Circuit.AllBusMagPu()[end] ≋ 0.9980241903846725
@test Circuit.AllNodeNames()[end] == "sx3784018a.2"
if typeof(1) == Int64
    # results in OutOfMemoryError on x86 Windows
    @test Circuit.SystemY()[1, 1] == 0.0 - 1000.067575299307im
end
@test Circuit.AllBusDistances()[end] ≋ 0.0
@test Circuit.AllNodeDistances()[end] ≋ 0.0
@test Circuit.AllNodeVmagByPhase(1)[end] ≋ 119.84458695805009
@test Circuit.AllNodeVmagPUByPhase(1)[end] ≋ 0.9979659308819673
@test Circuit.AllNodeDistancesByPhase(1)[end] == 0.0
@test Circuit.AllNodeNamesByPhase(1)[end] == "sx3784018a.1"
@test Circuit.YNodeVArray()[end] ≋ -85.01962676301814 + 84.47523352214344im
@test Circuit.YNodeOrder()[end] == "SX3784018A.2"
@test Circuit.YCurrents()[end] ≋ 0.032757937074590515 - 0.054281873453359im

Circuit.FromJSON(raw"""{
    "$schema": "https://dss-extensions.org/altdss-schema/2023-12-13.schema.json",
    "Name": "4busdybal",
    "DefaultBaseFreq": 60.0,
    "PreCommands": [
        "Set EarthModel=Carson",
        "Set VoltageBases=[ 12.470000000000001 4.1600000000000001]"
    ],
    "WireData": [
        {
            "Name": "conductor",
            "RUnits": "mi",
            "RAC": 0.306,
            "GMRUnits": "ft",
            "GMRAC": 0.0244,
            "RadUnits": "in",
            "Radius": 0.3605,
            "NormAmps": 530.0
        },
        {
            "Name": "neutral",
            "RUnits": "mi",
            "RAC": 0.592,
            "GMRUnits": "ft",
            "GMRAC": 0.00814,
            "RadUnits": "in",
            "Radius": 0.2815,
            "NormAmps": 340.0
        }
    ],
    "LineGeometry": [
        {
            "Name": "4wire",
            "NConds": 4,
            "NPhases": 3,
            "Reduce": true,
            "Conductors": [
                "WireData.conductor",
                "WireData.conductor",
                "WireData.conductor",
                "WireData.neutral"
            ],
            "Units": [
                "ft",
                "ft",
                "ft",
                "ft"
            ],
            "X": [
                -4.0,
                -1.5,
                3.0,
                0.0
            ],
            "H": [
                28.0,
                28.0,
                28.0,
                24.0
            ]
        }
    ],
    "Line": [
        {
            "Name": "line1",
            "Geometry": "4wire",
            "Ratings": [
                0.0
            ],
            "NormAmps": 530.0,
            "EmergAmps": 795.0,
            "Length": 2000.0,
            "Units": "ft",
            "Bus1": "sourcebus",
            "Bus2": "n2"
        },
        {
            "Name": "line2",
            "Bus1": "n3",
            "Bus2": "n4",
            "Geometry": "4wire",
            "Ratings": [
                0.0
            ],
            "NormAmps": 530.0,
            "EmergAmps": 795.0,
            "Length": 2500.0,
            "Units": "ft"
        }
    ],
    "Vsource": [
        {
            "Name": "source",
            "Bus1": "sourcebus",
            "BasekV": 12.47,
            "Phases": 3,
            "MVASC3": 200000.0,
            "MVASC1": 200000.0
        }
    ],
    "Load": [
        {
            "Name": "load1",
            "Phases": 3,
            "Bus1": "n4",
            "Conn": "wye",
            "kV": 4.16,
            "kW": 5400.0,
            "PF": 0.9,
            "Model": 1,
            "VMinpu": 0.75
        }
    ],
    "Transformer": [
        {
            "Name": "t1",
            "X12": 6.0,
            "Bus": [
                "n2",
                "n3"
            ],
            "Conn": [
                "delta",
                "wye"
            ],
            "kV": [
                12.47,
                4.16
            ],
            "kVA": [
                6000.0,
                6000.0
            ],
            "pctR": [
                0.5,
                0.5
            ]
        }
    ]
}""", Int32(0))

@test Circuit.Name() == "4busdybal"
@test Circuit.NumBuses() == 4
@test Circuit.NumNodes() == 12

# TODO: add JSON.jl as a dependency?
circ = lowercase(Circuit.ToJSON(Int32(0)))

# check some fragments of the JSON-encoded string
@test occursin("wiredata.neutral", circ)
@test occursin("wiredata.conductor", circ)
@test occursin("4wire", circ)
@test occursin("sourcebus", circ)
@test occursin("set controlmode=static", circ)
@test occursin("set basefrequency=60", circ)



saved = lowercase(Circuit.Save("", 
    OpenDSSDirect.Lib.DSSSaveFlags_ToString | 
    OpenDSSDirect.Lib.DSSSaveFlags_SingleFile |
    OpenDSSDirect.Lib.DSSSaveFlags_IncludeOptions
))

# check some fragments of the DSS script string
@test occursin("wiredata.neutral", saved)
@test occursin("wiredata.conductor", saved)
@test occursin("4wire", saved)
@test occursin("sourcebus", saved)
@test occursin("set controlmode=static", saved)
@test occursin("set basefrequency=60", saved)



end # testset

