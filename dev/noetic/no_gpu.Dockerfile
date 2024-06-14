FROM docker.io/osrf/ros:noetic-desktop-full
ARG USERNAME=rosuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  #
  # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
  && apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip
ENV SHELL /bin/bash

# Install MoveIt
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-moveit

# Install Gazebo
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
RUN apt-get update && apt-get install -y gazebo11 libgazebo11-dev

# Install TurtleBot3
## TurtleBot3 Dependencies
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-joy ros-$ROS_DISTRO-teleop-twist-joy \
  ros-$ROS_DISTRO-teleop-twist-keyboard ros-$ROS_DISTRO-laser-proc \
  ros-$ROS_DISTRO-rgbd-launch ros-$ROS_DISTRO-rosserial-arduino \
  ros-$ROS_DISTRO-rosserial-python ros-$ROS_DISTRO-rosserial-client \
  ros-$ROS_DISTRO-rosserial-msgs ros-$ROS_DISTRO-amcl ros-$ROS_DISTRO-map-server \
  ros-$ROS_DISTRO-move-base ros-$ROS_DISTRO-urdf ros-$ROS_DISTRO-xacro \
  ros-$ROS_DISTRO-compressed-image-transport ros-$ROS_DISTRO-rqt* ros-$ROS_DISTRO-rviz \
  ros-$ROS_DISTRO-gmapping ros-$ROS_DISTRO-navigation ros-$ROS_DISTRO-interactive-markers

## TurtleBot3 Packages
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-dynamixel-sdk
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-turtlebot3*

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# Configure User
USER $USERNAME
RUN echo "source /opt/ros/noetic/setup.bash" >> /home/rosuser/.bashrc
RUN echo "source /home/rosuser/ws/devel/setup.bash || echo 'Workspace not Ready. Run catkin_make at /home/rosuser/ws'" >> /home/rosuser/.bashrc
RUN echo "export TURTLEBOT3_MODEL=waffle" >> /home/rosuser/.bashrc
RUN echo "export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/$ROS_DISTRO/share/turtlebot3_gazebo/models" >> /home/rosuser/.bashrc

CMD ["/bin/bash"]
