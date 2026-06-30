# Platform-specific settings

# Detect OS
case "$(uname -s)" in
    Linux*)
        # fcitx5 input method (Linux only)
        export GTK_IM_MODULE=fcitx
        export QT_IM_MODULE=fcitx
        export XMODIFIERS=@im=fcitx
        export INPUT_METHOD=fcitx
        export SDL_IM_MODULE=fcitx
        export GLFW_IM_MODULE=ibus
        ;;
    Darwin*)
        # macOS specific settings can go here
        ;;
esac
