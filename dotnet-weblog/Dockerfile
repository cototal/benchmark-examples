FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster

RUN sed -i "s|DEFAULT@SECLEVEL=2|DEFAULT@SECLEVEL=1|g" /etc/ssl/openssl.cnf
