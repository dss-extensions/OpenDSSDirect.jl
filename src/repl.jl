import Base: LineEdit, REPL

## This code was adapted from the following:
##    https://github.com/Keno/Gallium.jl/blob/1ef7111880495f3c5a7989d88a5fbc60e7eeb285/src/lldbrepl.jl
## Copyright (c) 2015: Keno Fischer. Licensed under the MIT "Expat" License:
##    https://github.com/Keno/Gallium.jl/blob/b4bc668a4cbd0f2d4f63fbdb0597a1264afd7b4d/LICENSE.md

function run_dss_repl()
    repl = Base.active_repl
    mirepl = isdefined(repl,:mi) ? repl.mi : repl

    main_mode = mirepl.interface.modes[1]

    # Setup the repl panel
    panel = LineEdit.Prompt("DSS> ";
        # Copy colors from the prompt object
        prompt_prefix=Base.text_colors[:blue],
        prompt_suffix=main_mode.prompt_suffix,
        on_enter = s->true)

    hp = main_mode.hist
    hp.mode_mapping[:dss] = panel
    panel.hist = hp

    panel.on_done = REPL.respond(repl,panel; pass_empty = false) do line
        if !isempty(line)
            :( print(OpenDSSDirect.DSS.dss($line)) )
        else
            :(  )
        end
    end


    push!(mirepl.interface.modes,panel)

    const dss_keymap = Dict{Any,Any}(
        ']' => function (s,args...)
            if isempty(s)
                if !haskey(s.mode_state,panel)
                    s.mode_state[panel] = LineEdit.init_state(repl.t,panel)
                end
                LineEdit.transition(s,panel)
            else
                LineEdit.edit_insert(s,']')
            end
        end
    )

    search_prompt, skeymap = LineEdit.setup_search_keymap(hp)
    mk = REPL.mode_keymap(main_mode)

    b = Dict{Any,Any}[skeymap, mk, LineEdit.history_keymap, LineEdit.default_keymap, LineEdit.escape_defaults]
    panel.keymap_dict = LineEdit.keymap(b)

    main_mode.keymap_dict = LineEdit.keymap_merge(main_mode.keymap_dict, dss_keymap);
    nothing
end