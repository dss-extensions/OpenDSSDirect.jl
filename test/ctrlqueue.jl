
init8500()


@testset "CtrlQueue" begin 

@show CtrlQueue.ClearQueue()
# @show CtrlQueue.Delete()
@show CtrlQueue.NumActions()
# @show CtrlQueue.Action(CtrlQueue.Action())
@show CtrlQueue.ActionCode()
@show CtrlQueue.DeviceHandle()
@show CtrlQueue.Push()
@show CtrlQueue.Show()
@show CtrlQueue.ClearActions()
@show CtrlQueue.PopAction()

end # testset

