FROM openjdk:8-jdk-slim

# Install curl and unzip for downloading and extracting PMD
RUN apt-get update && apt-get install -y \
    curl \
    unzip

# Download and extract PMD
RUN curl -L https://github.com/pmd/pmd/archive/refs/tags/pmd_releases/7.12.0.zip -o pmd.zip && \
    unzip pmd.zip -d /opt && \
    rm pmd.zip

# Set the PMD directory
ENV PMD_HOME /opt/pmd-pmd_releases-7.12.0
ENV PATH $PMD_HOME/bin:$PATH

# Install any additional dependencies needed for Apex if necessary

# Set the working directory to /src where the Apex code will be mounted
WORKDIR /src

# Default command to run PMD
CMD ["pmd", "-d", ".", "-R", "rulesets/apex/quickstart.xml", "-f", "text"]
