FROM mcr.microsoft.com/dotnet/framework/aspnet:4.7.2-windowsservercore-ltsc2019 
RUN mkdir /inetpub/wwwroot/temp
RUN cacls c:\inetpub\wwwroot\temp /e /p Everyone:f
RUN /windows/system32/inetsrv/appcmd.exe set config /section:requestfiltering /requestlimits.maxallowedcontentlength:60000000
RUN iisreset

COPY ./bin/Release/Publish/ /inetpub/wwwroot