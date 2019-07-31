FROM dyne/devuan:ascii
LABEL maintainer="Micah P. Dombrowski <mpdwibble@gmail.com> \
      homepage="https://github.com/WibbletheDuck/devuan-postfix"

RUN apt-get update \
 && apt-get upgrade -y --with-new-pkgs \
 && apt-get install -y --no-install-recommends postfix \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/* # Clear package list so it isn't stale

WORKDIR /root
ENTRYPOINT ["/tini", "--"]

CMD /bin/bash
