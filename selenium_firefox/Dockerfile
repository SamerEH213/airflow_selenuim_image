# Use the Selenium standalone Firefox image as the base image
FROM selenium/standalone-firefox

# Set environment variables with default values
ENV TIME_CHNAGE_IP=60
ENV MANY_TIME_CHNAGE_IP=0

# Switch to the root user (not necessary if base image already runs as root)
USER root

# Update the package list to ensure we have the latest information
RUN apt update -y 

# Upgrade all installed packages to their latest versions
RUN apt upgrade -y

# # Install Git to clone the repository
RUN apt-get install -y git

# # Install the Python 3.12 virtual environment package
RUN apt install python3.12-venv -y

# # Clone the repository containing the Auto Tor IP changer script
RUN git clone https://github.com/SamerEH213/Auto_Tor_IP_changer_Docker_Version.git

# # Set the working directory to the location of the cloned repository
WORKDIR /Auto_Tor_IP_changer_Docker_Version

# # Make the install.py script executable
RUN chmod +x install.py

# # Install pip for Python 3 (ensure it's available in the environment)
RUN sudo apt install python3-pip -y

# # Create a Python virtual environment, activate it, and install dependencies
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install requests[socks] fastapi uvicorn
# Install Tor for IP changing functionality
RUN sudo apt install tor -y

#COPY test2.py /Auto_Tor_IP_changer_Docker_Version/main.py
# Define the default command to run when the container starts
# Activate the virtual environment and execute the autoTOR.py script
#sha256:ce426041bb7383c72b443c591fa5e5f66f3baa661331082b145c20eedaa70068
CMD ["/bin/bash", "-c", "cd /Auto_Tor_IP_changer_Docker_Version && . venv/bin/activate && python3 autoTOR.py"]
