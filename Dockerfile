FROM mathworks/matlab:r2023b

# Instalación de dependencias y limpieza para reducir el tamaño de la imagen
RUN sudo apt-get update && \
    sudo apt-get install -y git curl && \
    sudo rm -rf /var/lib/apt/lists/*

# Copiar el directorio cobratoolbox al directorio home del usuario `matlab` dentro del contenedor
COPY --chown=matlab:matlab cobratoolbox /home/matlab/cobratoolbox
# Copiar el script initCobraScript.m al directorio Documents/MATLAB del usuario `matlab`
COPY --chown=matlab:matlab initCobraScript.m /home/matlab/Documents/MATLAB/initCobraScript.m
# Ejecutar el script de MATLAB al iniciar el contenedor
# Nota: La ejecución del script necesita ser adaptada a la forma en que MATLAB espera recibir comandos en esta imagen
CMD ["matlab", "-batch", "initCobraScript", "-licmode", "online"]
