function aactivate --on-event fish_postexec
    if set -q VIRTUAL_ENV && not test -e .venv/bin/activate.fish
        deactivate
    end
    if test -e .venv/bin/activate.fish && not set -q VIRTUAL_ENV
        source .venv/bin/activate.fish
    end

end
