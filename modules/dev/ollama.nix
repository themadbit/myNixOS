{ pkgs-unstable, ... }:
{
  # Run ollama as a system service with CUDA support (plain `ollama` is CPU-only)
  services.ollama = {
    enable = true;
    package = pkgs-unstable.ollama-cuda;
  };
}
