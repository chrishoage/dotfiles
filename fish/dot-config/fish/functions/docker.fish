if not command -q docker; and command -q podman
    function docker --wraps=podman --description 'alias docker podman'
        podman $argv
    end
end