# Build from the MATLAB base image
FROM mathworks/matlab:r2023b

# Load and update packages
RUN apt-get update && apt-get install -y git
# Clone repo on /opt/cobratoolbox
RUN git clone https://github.com/opencobra/cobratoolbox.git /opt/cobratoolbox

