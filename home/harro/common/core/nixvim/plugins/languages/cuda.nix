{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    cuda.enable = lib.mkEnableOption "cuda language";
  };

  config = lib.mkIf config.cuda.enable {
    home.packages = with pkgs; [
      # cudatoolkit
      cudaPackages.cudatoolkit
      cudaPackages.cuda_cudart
      # cudnn # Optional, for deep learning frameworks
      cudaPackages.cuda_nvprof
      # gcc11
      gnumake # For building CUDA projects
      cmake # Optional, if using CMake for CUDA projects
    ];

    # Set up environment variables for CUDA
    home.sessionVariables = {
      CUDA_HOME = "${pkgs.cudaPackages.cudatoolkit}";
      PATH = "${pkgs.cudaPackages.cudatoolkit}/bin:$PATH";
      # Setting include and library paths explicitly
      C_INCLUDE_PATH = "${pkgs.cudaPackages.cudatoolkit}/include:$C_INCLUDE_PATH";
      CPLUS_INCLUDE_PATH = "${pkgs.cudaPackages.cudatoolkit}/include:$CPLUS_INCLUDE_PATH";
      LD_LIBRARY_PATH = "${pkgs.cudaPackages.cuda_nvprof.lib}/lib:${pkgs.cudaPackages.cuda_cudart.lib}/lib:${pkgs.cudaPackages.cudatoolkit}/lib:$LD_LIBRARY_PATH";
    };
  };
}
