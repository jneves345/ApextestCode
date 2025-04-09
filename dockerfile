# Use an OpenJDK 8 base image
FROM openjdk:8-jdk-slim

# Install required utilities: curl and unzip
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Set the PMD version as an environment variable.
ENV PMD_VERSION=7.12.0

# Download and extract PMD.
# The correct zip URL is from the PMD releases on GitHub:
# https://github.com/pmd/pmd/archive/refs/tags/pmd_releases/7.12.0.zip
RUN curl -L "https://github.com/pmd/pmd/archive/refs/tags/pmd_releases/${PMD_VERSION}.zip" -o pmd.zip && \
    unzip pmd.zip -d /opt && \
    rm pmd.zip && \
    # Rename the extracted directory for convenience.
    mv /opt/pmd-pmd_releases-${PMD_VERSION} /opt/pmd

# Add PMD's bin directory to the PATH.
ENV PATH="/opt/pmd/bin:${PATH}"

# Set the working directory. This is where your Apex code will be mounted.
WORKDIR /src

# Default command: run PMD check on the mounted source folder using an Apex ruleset.
# Output the report to /reports/pmd-report.html
CMD ["pmd", "check", "-d", "/src", "-R", "rulesets/apex/quickstart.xml", "-f", "html", "-r", "/reports/pmd-report.html"]

