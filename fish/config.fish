if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path /usr/local/bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/.deno/bin
    fish_add_path $HOME/yarn/bin
    
    # bun
    set -Ux BUN_INSTALL $HOME/.bun
    fish_add_path $BUN_INSTALL/bin

    hyfetch
end
