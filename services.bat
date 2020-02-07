@echo off

echo Starting Services Script...

:stop
echo Stopping bad services...
sc stop iphlpsvc
sc config iphlpsvc start= disabled

sc stop SharedAccess
sc config SharedAccess start= disabled

sc stop Fax
sc config Fax start= disabled

sc stop lmhosts
sc config lmhosts start= disabled

sc stop NetTcpPortSharing
sc config NetTcpPortSharing start= disabled

sc stop iprip
sc config iprip start= disabled

sc stop simptcp
sc config simptcp start= disabled

sc stop CscService
sc config CscService start= disabled

sc stop PlugPlay
sc config PlugPlay start= disabled

sc stop PNRPAutoReg
sc config PNRPAutoReg start= disabled

sc stop Spooler
sc config Spooler start= disabled

sc stop bthserv
sc config bthserv start= disabled

sc stop HomeGroupListener
sc config HomeGroupListener start= disabled

sc stop HomeGroupProvider
sc config HomeGroupProvider start= disabled

sc stop napagent
sc config napagent start= disabled

sc stop PrintNotify
sc config PrintNotify start= disabled

sc stop QWAVE
sc config QWAVE start= disabled

sc stop RpcEptMapper
sc config RpcEptMapper start= disabled

sc stop SharedAccess
sc config SharedAccess start= disabled

sc stop SNMPTRAP
sc config SNMPTRAP start= disabled

sc stop SysMain
sc config SysMain start= disabled

sc stop TapiSrv
sc config TapiSrv start= disabled

sc stop TlntSvr
sc config TlntSvr start= disabled

sc stop RpcLocator
sc config RpcLocator start= disabled

sc stop Themes
sc config Themes start= disabled

:RDP
echo Remote Desktop? (y/n)
#get around to acutally implementing this


sc stop TermService
sc config TermService start= disabled

sc stop Netlogon
sc config Netlogon start= disabled

sc stop RpcSs
sc config RpcSs start= disabled

sc stop SessionEnv
sc config SessionEnv start= disabled

sc stop upnphost
sc config upnphost start= disabled

sc stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled

sc stop WebClient
sc config WebClient start= disabled

sc stop remoteregistry
sc config remoteregistry start= disabled





:start
echo Starting good services (cough Event Log cough)...

sc start EventLog
sc config EventLog start= auto

sc start wscsvc
sc config wscsvc start= auto

sc start MpsSvc
sc config MpsSvc start= auto

sc start pla
sc config pla start= auto

sc start SamSs
sc config SamSs start= auto

sc start Schedule
sc config Schedule start= auto

sc start SENS
sc config SENS start= auto

sc start SystemEventsBroker
sc config SystemEventsBroker start= auto

sc start TimeBroker
sc config TimeBroker start= auto

sc start W32Time
sc config W32Time start= auto

sc start Wcmsvc
sc config Wcmsvc start= auto

sc start WdiSystemHost
sc config WdiSystemHost start= auto

sc start WdNisSvc
sc config WdNisSvc start= auto

sc start Wecsvc
sc config Wecsvc start= auto

sc start WEPHOSTSVC
sc config WEPHOSTSVC start= auto

sc start WinDefend
sc config WinDefend start= auto

sc start winmgmt
sc config winmgmt start= auto

sc start wuauserv
sc config wuauserv start= auto



sc start mpssvc
sc config mpssvc start= auto
netsh advfirewall set allprofiles state on