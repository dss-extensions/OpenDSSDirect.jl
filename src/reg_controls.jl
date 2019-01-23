module RegControls

    using ..lib
    using ..utils

    function Reset()
        lib.RegControls_Reset()
    end

    """(read-only) Array of strings containing all RegControl names"""
    function AllNames()
        return get_string_array(lib.RegControls_Get_AllNames)
    end

    """CT primary ampere rating (secondary is 0.2 amperes)"""
    function CTPrimary()
        return lib.RegControls_Get_CTPrimary()
    end

    """CT primary ampere rating (secondary is 0.2 amperes)"""
    function CTPrimary(Value)
        lib.RegControls_Set_CTPrimary(Value)
    end

    """(read-only) Number of RegControl objects in Active Circuit"""
    function Count()
        return lib.RegControls_Get_Count()
    end

    """Time delay [s] after arming before the first tap change. Control may reset before actually changing taps."""
    function Delay()
        return lib.RegControls_Get_Delay()
    end

    """Time delay [s] after arming before the first tap change. Control may reset before actually changing taps."""
    function Delay(Value)
        lib.RegControls_Set_Delay(Value)
    end

    """(read-only) Sets the first RegControl active. Returns 0 if none."""
    function First()
        return lib.RegControls_Get_First()
    end

    """Regulation bandwidth in forward direciton, centered on Vreg"""
    function ForwardBand()
        return lib.RegControls_Get_ForwardBand()
    end

    """Regulation bandwidth in forward direciton, centered on Vreg"""
    function ForwardBand(Value)
        lib.RegControls_Set_ForwardBand(Value)
    end

    """LDC R setting in Volts"""
    function ForwardR()
        return lib.RegControls_Get_ForwardR()
    end

    """LDC R setting in Volts"""
    function ForwardR(Value)
        lib.RegControls_Set_ForwardR(Value)
    end

    """Target voltage in the forward direction, on PT secondary base."""
    function ForwardVreg()
        return lib.RegControls_Get_ForwardVreg()
    end

    """Target voltage in the forward direction, on PT secondary base."""
    function ForwardVreg(Value)
        lib.RegControls_Set_ForwardVreg(Value)
    end

    """LDC X setting in Volts"""
    function ForwardX()
        return lib.RegControls_Get_ForwardX()
    end

    """LDC X setting in Volts"""
    function ForwardX(Value)
        lib.RegControls_Set_ForwardX(Value)
    end

    """Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band."""
    function IsInverseTime()
        return lib.RegControls_Get_IsInverseTime() != 0
    end

    """Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band."""
    function IsInverseTime(Value)
        lib.RegControls_Set_IsInverseTime(Value)
    end

    """Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers."""
    function IsReversible()
        return lib.RegControls_Get_IsReversible() != 0
    end

    """Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers."""
    function IsReversible(Value)
        lib.RegControls_Set_IsReversible(Value)
    end

    """Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster soluiton."""
    function MaxTapChange()
        return lib.RegControls_Get_MaxTapChange()
    end

    """Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster soluiton."""
    function MaxTapChange(Value)
        lib.RegControls_Set_MaxTapChange(Value)
    end

    """Name of a remote regulated bus, in lieu of LDC settings"""
    function MonitoredBus()
        return get_string(lib.RegControls_Get_MonitoredBus())
    end

    """Name of a remote regulated bus, in lieu of LDC settings"""
    function MonitoredBus(Value::String)
        lib.RegControls_Set_MonitoredBus(Value)
    end

    """
    (read) Get/set Active RegControl  name
    (write) Sets a RegControl active by name
    """
    function Name()
        return get_string(lib.RegControls_Get_Name())
    end


    """
    (read) Get/set Active RegControl  name
    (write) Sets a RegControl active by name
    """
    function Name(Value::String)
        lib.RegControls_Set_Name(Value)
    end

    """(read-only) Sets the next RegControl active. Returns 0 if none."""
    function Next()
        return lib.RegControls_Get_Next()
    end

    """PT ratio for voltage control settings"""
    function PTRatio()
        return lib.RegControls_Get_PTratio()
    end

    """PT ratio for voltage control settings"""
    function PTRatio(Value)
        lib.RegControls_Set_PTratio(Value)
    end

    """Bandwidth in reverse direction, centered on reverse Vreg."""
    function ReverseBand()
        return lib.RegControls_Get_ReverseBand()
    end

    """Bandwidth in reverse direction, centered on reverse Vreg."""
    function ReverseBand(Value)
        lib.RegControls_Set_ReverseBand(Value)
    end

    """Reverse LDC R setting in Volts."""
    function ReverseR()
        return lib.RegControls_Get_ReverseR()
    end

    """Reverse LDC R setting in Volts."""
    function ReverseR(Value)
        lib.RegControls_Set_ReverseR(Value)
    end

    """Target voltage in the revese direction, on PT secondary base."""
    function ReverseVreg()
        return lib.RegControls_Get_ReverseVreg()
    end

    """Target voltage in the revese direction, on PT secondary base."""
    function ReverseVreg(Value)
        lib.RegControls_Set_ReverseVreg(Value)
    end

    """Reverse LDC X setting in volts."""
    function ReverseX()
        return lib.RegControls_Get_ReverseX()
    end

    """Reverse LDC X setting in volts."""
    function ReverseX(Value)
        lib.RegControls_Set_ReverseX(Value)
    end

    """Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps."""
    function TapDelay()
        return lib.RegControls_Get_TapDelay()
    end

    """Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps."""
    function TapDelay(Value)
        lib.RegControls_Set_TapDelay(Value)
    end

    """Integer number of the tap that the controlled transformer winding is currentliy on."""
    function TapNumber()
        return lib.RegControls_Get_TapNumber()
    end

    """Integer number of the tap that the controlled transformer winding is currentliy on."""
    function TapNumber(Value)
        lib.RegControls_Set_TapNumber(Value)
    end

    """Tapped winding number"""
    function TapWinding()
        return lib.RegControls_Get_TapWinding()
    end

    """Tapped winding number"""
    function TapWinding(Value)
        lib.RegControls_Set_TapWinding(Value)
    end

    """Name of the transformer this regulator controls"""
    function Transformer()
        return get_string(lib.RegControls_Get_Transformer())
    end

    """Name of the transformer this regulator controls"""
    function Transformer(Value::String)
        lib.RegControls_Set_Transformer(Value)
    end

    """First house voltage limit on PT secondary base.  Setting to 0 disables this function."""
    function VoltageLimit()
        return lib.RegControls_Get_VoltageLimit()
    end

    """First house voltage limit on PT secondary base.  Setting to 0 disables this function."""
    function VoltageLimit(Value)
        lib.RegControls_Set_VoltageLimit(Value)
    end

    """Winding number for PT and CT connections"""
    function Winding()
        return lib.RegControls_Get_Winding()
    end

    """Winding number for PT and CT connections"""
    function Winding(Value)
        lib.RegControls_Set_Winding(Value)
    end

end

