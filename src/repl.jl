
module Repl

    import REPL
    import REPL.LineEdit

    ## This code was adapted from the following:
    ##    https://github.com/Keno/Gallium.jl/blob/1ef7111880495f3c5a7989d88a5fbc60e7eeb285/src/lldbrepl.jl
    ## Copyright (c) 2015: Keno Fischer. Licensed under the MIT "Expat" License:
    ##    https://github.com/Keno/Gallium.jl/blob/b4bc668a4cbd0f2d4f63fbdb0597a1264afd7b4d/LICENSE.md

    function run_dss_repl()
        repl = Base.active_repl
        mirepl = isdefined(repl,:mi) ? repl.mi : repl

        main_mode = mirepl.interface.modes[1]

        dss_keymap = Dict{Any,Any}(
            ')' => function (s,args...)
                if isempty(s)
                    if !haskey(s.mode_state,panel)
                        s.mode_state[panel] = LineEdit.init_state(repl.t,panel)
                    end
                    LineEdit.transition(s,panel)
                else
                    LineEdit.edit_insert(s,')')
                end
            end
            # 'x' => function (s,args...)
            #     s.mode_state[main_mode] = LineEdit.init_state(repl.t,main_mode)
            #     LineEdit.transition(s,main_mode)
            # end
        )
        dsshelp_keymap = Dict{Any,Any}(
            '?' => function (s,args...)
                if isempty(s)
                    if !haskey(s.mode_state,panelhelp)
                        s.mode_state[panelhelp] = LineEdit.init_state(repl.t,panelhelp)
                    end
                    LineEdit.transition(s,panelhelp)
                else
                    LineEdit.edit_insert(s,'?')
                end
            end
        )
        # Setup the repl panel
        panel = LineEdit.Prompt("DSS> ";
            # Copy colors from the prompt object
            prompt_prefix=Base.text_colors[:blue],
            prompt_suffix=main_mode.prompt_suffix,
            # on_enter = s->true)
            on_enter = REPL.return_callback)
        panelhelp = LineEdit.Prompt("DSS help?> ";
            # Copy colors from the prompt object
            prompt_prefix=Base.text_colors[:magenta],
            prompt_suffix=main_mode.prompt_suffix,
            on_enter = s->true)

        hp = main_mode.hist
        hp.mode_mapping[:dss] = panel
        hp.mode_mapping[:dsshelp] = panelhelp
        panel.hist = hp
        panelhelp.hist = hp

        panel.on_done = REPL.respond(repl,panel; pass_empty = false) do line
            if !isempty(line)
                :( print(OpenDSSDirect.Text.Command($line)) )
            else
                :(  )
            end
        end
        panelhelp.on_done = REPL.respond(repl,panel; pass_empty = false) do line
            if !isempty(line)
                :( OpenDSSDirect.Repl.help($line) )
            else
                :(  )
            end
        end

        push!(mirepl.interface.modes,panel)
        push!(mirepl.interface.modes,panelhelp)

        search_prompt, skeymap = LineEdit.setup_search_keymap(hp)
        mk = REPL.mode_keymap(main_mode)

        b = Dict{Any,Any}[skeymap, mk, LineEdit.history_keymap, LineEdit.default_keymap, LineEdit.escape_defaults]

        main_mode.keymap_dict = LineEdit.keymap_merge(main_mode.keymap_dict, dss_keymap);
        panel.keymap_dict = LineEdit.keymap_merge(LineEdit.keymap(b), dsshelp_keymap);
        panelhelp.keymap_dict = LineEdit.keymap(b)
        nothing
    end

    function help(line)
        println(get(OpenDSSDirect.commandhelp, lowercase(line), ""))
        println(get(OpenDSSDirect.optionhelp, lowercase(line), ""))
        classes = OpenDSSDirect.Basic.Classes()
        if lowercase(line) == "classes"
            map(println, classes)
        end
        if any(classes .== line)
            OpenDSSDirect.Circuit.SetActiveClass(line)
            OpenDSSDirect.Circuit.FirstElement()
            map(println, OpenDSSDirect.Element.AllPropertyNames())
        end
        nothing
    end

end
