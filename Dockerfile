FROM coderus/sailfishos-platform-sdk-base:3.0.3.8

WORKDIR /home/nemo

COPY Jolla-@RELEASE@-vince-@ARCH@.ks run-mice.sh vince.env /home/nemo/

ENTRYPOINT ["/home/nemo/run-mic.sh"]