FROM gitpod/workspace-postgres

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
RUN echo "rvm_gems_path=/home/gitpod/.rvm" > ~/.rvmrc
RUN bash -lc "rvm install ruby-2.7.0 && \
              rvm use ruby-ruby-2.7.0 --default"
RUN echo "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc