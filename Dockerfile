FROM intelpython/intelpython3_core
MAINTAINER Yueh-Hua Tu <a504082002@gmail.com>

ADD requirements.txt requirements.txt

# Install dependencies
RUN pip install --trusted-host pypi.python.org -r requirements.txt && \
    apt-get update -qq && \
	apt-get install -yq --no-install-recommends curl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install ncbi-blast+
RUN mkdir -p /blast && \
    curl ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.8.1/ncbi-blast-2.8.1+-x64-linux.tar.gz \
      | tar -zxC /blast
ENV PATH $PATH:/blast/ncbi-blast-2.8.1\+/bin

CMD ["/bin/bash"]
