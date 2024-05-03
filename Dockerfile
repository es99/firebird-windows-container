FROM mcr.microsoft.com/windows/servercore:ltsc2022

LABEL version="1.0" \
    maintainer="Engels Souza <engels.franca@gmail.com>" \
    organization="Info Public <contato@infopublicpb.com.br>" \
    description="This image aims to download and install Firebird Server 2.0.5 for windows"

WORKDIR c:\\Firebird
ADD https://infopublic-downloads.s3.sa-east-1.amazonaws.com/Firebird-2.0.5.13206_1_win32.exe .

RUN powershell.exe -Command .\\Firebird-2.0.5.13206_1_win32.exe -ArgumentList '/verysilent' -Wait

EXPOSE 3050

ENTRYPOINT ["c:\\Program Files (x86)\\Firebird\\Firebird_2_0\\bin\\fbserver.exe", "-a"]