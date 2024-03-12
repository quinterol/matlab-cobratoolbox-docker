# Build from the MATLAB base image
FROM mathworks/matlab:r2023b
# Instalacion de dependencias
RUN sudo apt-get update && sudo apt-get install -y git curl && sudo rm -rf /var/lib/apt/lists/*
# Copiar el directorio cobratoolbox al directorio home del usuario `matlab` dentro del contenedor
COPY --chown=matlab:matlab cobratoolbox /home/matlab/cobratoolbox
# Cambiar al directorio de COBRA Toolbox y ejecutar initCobraToolbox desde MATLAB
# Ajusta el comando para referenciar la nueva ubicación de COBRA Toolbox
#WORKDIR /home/matlab/cobratoolbox
#RUN matlab -licmode online -batch "addpath(genpath('/home/matlab/cobratoolbox')), savepath, initCobraToolbox(false);"
