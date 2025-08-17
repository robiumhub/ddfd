# Generated Dockerfile for Project Configuration
# Project: Project Configuration
# Type: custom
# Generated: 2025-08-17T17:02:01.893Z

FROM ros:humble-ros-base-jammy

# Configure RMW implementation
ENV RMW_IMPLEMENTATION=cyclonedds

# Set working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV ROS_DISTRO=humble
ENV RMW_IMPLEMENTATION=cyclonedds

# Expose ports
EXPOSE 9090

# Copy application code
COPY . .

# Set default command

# Install Foxglove Studio Bridge
RUN pip3 install foxglove-bridge

# Expose Foxglove port
EXPOSE 9090
CMD foxglove-bridge
