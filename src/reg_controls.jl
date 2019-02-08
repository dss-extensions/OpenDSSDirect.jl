module RegControls

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    function Reset()
        Lib.RegControls_Reset()
    end

    """Array of strings containing all RegControl names"""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.RegControls_Get_AllNames)
    end

    """CT primary ampere rating (secondary is 0.2 amperes) (Getter)"""
    function CTPrimary()::Float64
        return Lib.RegControls_Get_CTPrimary()
    end

    """CT primary ampere rating (secondary is 0.2 amperes) (Setter)"""
    function CTPrimary(Value::Float64)
        Lib.RegControls_Set_CTPrimary(Value)
    end

    """Number of RegControl objects in Active Circuit"""
    function Count()::Int
        return Lib.RegControls_Get_Count()
    end

    """Time delay [s] after arming before the first tap change. Control may reset before actually changing taps. (Getter)"""
    function Delay()::Float64
        return Lib.RegControls_Get_Delay()
    end

    """Time delay [s] after arming before the first tap change. Control may reset before actually changing taps. (Setter)"""
    function Delay(Value::Float64)
        Lib.RegControls_Set_Delay(Value)
    end

    """Sets the first RegControl active. Returns 0 if none."""
    function First()::Int
        return Lib.RegControls_Get_First()
    end

    """Regulation bandwidth in forward direciton, centered on Vreg (Getter)"""
    function ForwardBand()::Float64
        return Lib.RegControls_Get_ForwardBand()
    end

    """Regulation bandwidth in forward direciton, centered on Vreg (Setter)"""
    function ForwardBand(Value::Float64)
        Lib.RegControls_Set_ForwardBand(Value)
    end

    """LDC R setting in Volts (Getter)"""
    function ForwardR()::Float64
        return Lib.RegControls_Get_ForwardR()
    end

    """LDC R setting in Volts (Setter)"""
    function ForwardR(Value::Float64)
        Lib.RegControls_Set_ForwardR(Value)
    end

    """Target voltage in the forward direction, on PT secondary base. (Getter)"""
    function ForwardVreg()::Float64
        return Lib.RegControls_Get_ForwardVreg()
    end

    """Target voltage in the forward direction, on PT secondary base. (Setter)"""
    function ForwardVreg(Value::Float64)
        Lib.RegControls_Set_ForwardVreg(Value)
    end

    """LDC X setting in Volts (Getter)"""
    function ForwardX()::Float64
        return Lib.RegControls_Get_ForwardX()
    end

    """LDC X setting in Volts (Setter)"""
    function ForwardX(Value::Float64)
        Lib.RegControls_Set_ForwardX(Value)
    end

    """Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band. (Getter)"""
    function IsInverseTime()::Bool
        return Lib.RegControls_Get_IsInverseTime() != 0
    end

    """Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band. (Setter)"""
    function IsInverseTime(Value::Bool)
        Lib.RegControls_Set_IsInverseTime(Value ? 1 : 0)
    end

    """Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers. (Getter)"""
    function IsReversible()::Bool
        return Lib.RegControls_Get_IsReversible() != 0
    end

    """Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers. (Setter)"""
    function IsReversible(Value::Bool)
        Lib.RegControls_Set_IsReversible(Value ? 1 : 0)
    end

    """Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster solution. (Getter)"""
    function MaxTapChange()::Float64
        return Lib.RegControls_Get_MaxTapChange()
    end

    """Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster solution. (Setter)"""
    function MaxTapChange(Value::Float64)
        Lib.RegControls_Set_MaxTapChange(Value)
    end

    """Name of a remote regulated bus, in lieu of LDC settings (Getter)"""
    function MonitoredBus()::String
        return Utils.get_string(Lib.RegControls_Get_MonitoredBus())
    end

    """Name of a remote regulated bus, in lieu of LDC settings (Setter)"""
    function MonitoredBus(Value::String)
        Lib.RegControls_Set_MonitoredBus(Value)
    end

    """Active RegControl name (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.RegControls_Get_Name())
    end

    """Active RegControl name (Setter)"""
    function Name(Value::String)
        Lib.RegControls_Set_Name(Value)
    end

    """Sets the next RegControl active. Returns 0 if none."""
    function Next()::Int
        return Lib.RegControls_Get_Next()
    end

    """PT ratio for voltage control settings (Getter)"""
    function PTRatio()::Float64
        return Lib.RegControls_Get_PTratio()
    end

    """PT ratio for voltage control settings (Setter)"""
    function PTRatio(Value::Float64)
        Lib.RegControls_Set_PTratio(Value)
    end

    """Bandwidth in reverse direction, centered on reverse Vreg. (Getter)"""
    function ReverseBand()::Float64
        return Lib.RegControls_Get_ReverseBand()
    end

    """Bandwidth in reverse direction, centered on reverse Vreg. (Setter)"""
    function ReverseBand(Value::Float64)
        Lib.RegControls_Set_ReverseBand(Value)
    end

    """Reverse LDC R setting in Volts. (Getter)"""
    function ReverseR()::Float64
        return Lib.RegControls_Get_ReverseR()
    end

    """Reverse LDC R setting in Volts. (Setter)"""
    function ReverseR(Value::Float64)
        Lib.RegControls_Set_ReverseR(Value)
    end

    """Target voltage in the revese direction, on PT secondary base. (Getter)"""
    function ReverseVreg()::Float64
        return Lib.RegControls_Get_ReverseVreg()
    end

    """Target voltage in the revese direction, on PT secondary base. (Setter)"""
    function ReverseVreg(Value::Float64)
        Lib.RegControls_Set_ReverseVreg(Value)
    end

    """Reverse LDC X setting in volts. (Getter)"""
    function ReverseX()::Float64
        return Lib.RegControls_Get_ReverseX()
    end

    """Reverse LDC X setting in volts. (Setter)"""
    function ReverseX(Value::Float64)
        Lib.RegControls_Set_ReverseX(Value)
    end

    """Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps. (Getter)"""
    function TapDelay()::Float64
        return Lib.RegControls_Get_TapDelay()
    end

    """Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps. (Setter)"""
    function TapDelay(Value::Float64)
        Lib.RegControls_Set_TapDelay(Value)
    end

    """Integer number of the tap that the controlled transformer winding is currentliy on. (Getter)"""
    function TapNumber()::Int
        return Lib.RegControls_Get_TapNumber()
    end

    """Integer number of the tap that the controlled transformer winding is currentliy on. (Setter)"""
    function TapNumber(Value::Int)
        Lib.RegControls_Set_TapNumber(Value)
    end

    """Tapped winding number (Getter)"""
    function TapWinding()::Int
        return Lib.RegControls_Get_TapWinding()
    end

    """Tapped winding number (Setter)"""
    function TapWinding(Value::Int)
        Lib.RegControls_Set_TapWinding(Value)
    end

    """Name of the transformer this regulator controls (Getter)"""
    function Transformer()::String
        return Utils.get_string(Lib.RegControls_Get_Transformer())
    end

    """Name of the transformer this regulator controls (Setter)"""
    function Transformer(Value::String)
        Lib.RegControls_Set_Transformer(Value)
    end

    """First house voltage limit on PT secondary base.  Setting to 0 disables this function. (Getter)"""
    function VoltageLimit()::Float64
        return Lib.RegControls_Get_VoltageLimit()
    end

    """First house voltage limit on PT secondary base.  Setting to 0 disables this function. (Setter)"""
    function VoltageLimit(Value::Float64)
        Lib.RegControls_Set_VoltageLimit(Value)
    end

    """Winding number for PT and CT connections (Getter)"""
    function Winding()::Float64
        return Lib.RegControls_Get_Winding()
    end

    """Winding number for PT and CT connections (Setter)"""
    function Winding(Value::Float64)
        Lib.RegControls_Set_Winding(Value)
    end

end

