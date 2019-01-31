
module PDElements

    using ..Lib
    using ..Utils

    """(read-only) accummulated failure rate for this branch on downline"""
    function AccumulatedL()::Float64
        return Lib.PDElements_Get_AccumulatedL()
    end

    """(read-only) Number of PD elements (including disabled elements)"""
    function Count()::Int
        return Lib.PDElements_Get_Count()
    end

    """Get/Set Number of failures per year. For LINE elements: Number of failures per unit length per year. """
    function FaultRate()::Float64
        return Lib.PDElements_Get_FaultRate()
    end

    """Get/Set Number of failures per year. For LINE elements: Number of failures per unit length per year. """
    function FaultRate(Value::Float64)
        Lib.PDElements_Set_FaultRate(Value)
    end

    """(read-only) Set the first enabled PD element to be the active element.  Returns 0 if none found."""
    function First()::Int
        return Lib.PDElements_Get_First()
    end

    """(read-only) Number of the terminal of active PD element that is on the "from" side. This is set after the meter zone is determined."""
    function FromTerminal()::Int
        return Lib.PDElements_Get_FromTerminal()
    end

    """(read-only) Variant boolean indicating of PD element should be treated as a shunt element rather than a series element. Applies to Capacitor and Reactor elements in particular."""
    function IsShunt()::Bool
        return Lib.PDElements_Get_IsShunt() != 0
    end

    """(read-only) Failure rate for this branch. Faults per year including length of line."""
    function Lambda()::Float64
        return Lib.PDElements_Get_Lambda()
    end

    """Get/Set name of active PD Element. Returns null string if active element is not PDElement type."""
    function Name()::String
        return get_string(Lib.PDElements_Get_Name())
    end

    """Get/Set name of active PD Element. Returns null string if active element is not PDElement type."""
    function Name(Value::String)
        Lib.PDElements_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Advance to the next PD element in the circuit. Enabled elements only. Returns 0 when no more elements."""
    function Next()::Int
        return Lib.PDElements_Get_Next()
    end

    """(read-only) Number of customers, this branch"""
    function NumCustomers()::Int
        return Lib.PDElements_Get_Numcustomers()
    end

    """(read-only) Sets the parent PD element to be the active circuit element.  Returns 0 if no more elements upline."""
    function ParentPDElement()::Int
        return Lib.PDElements_Get_ParentPDElement()
    end

    """Average repair time for this element in hours"""
    function RepairTime()::Float64
        return Lib.PDElements_Get_RepairTime()
    end

    """Average repair time for this element in hours"""
    function RepairTime(Value::Float64)
        Lib.PDElements_Set_RepairTime(Value)
    end

    """(read-only) Integer ID of the feeder section that this PDElement branch is part of"""
    function SectionID()::Int
        return Lib.PDElements_Get_SectionID()
    end

    """(read-only) Total miles of line from this element to the end of the zone. For recloser siting algorithm."""
    function TotalMiles()::Float64
        return Lib.PDElements_Get_TotalMiles()
    end

    """(read-only) Total number of customers from this branch to the end of the zone"""
    function TotalCustomers()::Int
        return Lib.PDElements_Get_Totalcustomers()
    end

    """Get/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary."""
    function PctPermanent()::Float64
        return Lib.PDElements_Get_pctPermanent()
    end

    """Get/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary."""
    function PctPermanent(Value::Float64)
        Lib.PDElements_Set_pctPermanent(Value)
    end

end

