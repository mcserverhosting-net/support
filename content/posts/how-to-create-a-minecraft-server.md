---
title: "How to Create a Minecraft Server"
author: "quantomworks"
tags: ["cli", "server", "minecraft", "create"]
date: 2020-07-06T05:38:44-04:00
draft: false
---

{{< amp-img width="650" height="361" layout="responsive" src="https://www.howtogeek.com/wp-content/uploads/2015/08/xUntitled2-650x361.jpg.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.A2aSZyqNHU.jpg" alt="The command block can do a lot to servers." >}}

Quick on your feet? We have some example files [at our GitHub repo](https://github.com/mcserverhosting-net/mc-operator/tree/master/deploy/examples)


Our servers are created and managed by you, the user. The CLI gives you complete control of the server using a familiar YAML syntax that other plugins and mods use for their configuration. No slow dashboards, no limited capabilities. 

***Before you start, ensure you followed the guide on [how to setup mcsh](/support/post/how-to-setup-mcsh/)***.

## Going over the values

Setting up a server is as simple as running `mcsh apply -f the-server-config-file.yaml`. However, you will need to take account of a few values before we proceed.


## The Configuration File
```
apiVersion: mcserverhosting.net/v2
kind: MinecraftServer
```
We accept 3 **kinds** of deployments at the time of writing. BungeeServers, SFTP servers, and MinecraftServers. Each has its configuration and guide. The declaration above goes over the MinecraftServer type.

```
metadata:
  name: example-server
```
The name of your server goes here. It will hold your server's folder and identify your server for future use. Make sure it's unique. If it is the same name as another server, it will use that server's directory.

```
spec:
  online: true 
```
We now enter the specifications section of the server file. Universal values such as if it's online.

```
  minecraft:
    eula: true
    version: LATEST
    memory:
      initial: 1G
      max: 4G
      hugePages: 125M
```
Here, we set some general minecraft properties under spec.  These include the memory, version type, and the EULA. If the eula is false, your server will go in a crash loop.

```
servercore:
  type: VANILLA
  redownload: false
  properties:
    url:
    version:
```
For your server core, we support several initial server types. You can set this to VANILLA, FORGE, SPIGOT, TUINITY, MAGMA, MOHIST, CATSERVER, SPONGEVANILLA, FABRIC, and PAPER.

If for some reason you need to redownload the server core, set the redownload file. 

```
  network:
    domainName: 
```
Using domain name, you can declare the domain name you wish to use. If the domain is available, we will attempt to use this domain to route to your Minecraft server. Available primary domains are play.minecraftserverhost.xyz, play.minecraftserverhost.best, play.minecraftserver.host, play.minecraftserverhosting.sh, and play.mcserverhosting.net. 

```
java:
  args:
  argsdd: fml.queryResult:confirm
  argsxx: -XX:+UseLargePagesInMetaspace -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AlwaysPreTouch -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:+UseLargePages -XX:LargePageSizeInBytes=2m
```

We allow you to set custom java args! We deploy some recommended ones by default. **Always** keep `-XX:+UnlockExperimentalVMOptions` and `-XX:+UseCGroupMemoryLimitForHeap` or your server could try to use more memory than it should.

```
  config:
    icon: 
    modpack: 
    mods: 
    motd: 
    removeOldMods: false
    resourcePack:
      sha: 
      url: 
    server:
      gameSettings:
        announcePlayerAchievements: true
        commandBlocks: true
        difficulty: null
        flight: true
        hardcore: false
        nether: false
        pvp: false
        snooper: true
      maxTickTime: 20000
      network:
        maxPlayers: 2020
        onlineMode: true
        query: true
      restrictions:
        forceGamemode: true
        ops: 
        whitelist: 
    world:
      generateStructures: false
      generatorSettings: 
      level: 
      mode: 
      name: 
      restrictions:
        maxBuildHeight: 256
        maxSize: 1000
        spawnProtection: 0
        viewDistance: 32
      seed: 
      spawnAnimals: false
      spawnNpcs: false
      url: 
```
The config section contains some general server.properties config that your server will start with on its first launch. You can find out more about the server.properties file on the Minecraft wiki [here](https://minecraft.gamepedia.com/Server.properties#Minecraft_server_properties)

```
  overrideOnStartup: true
  forceRedownload: false
```
These are override values. If you want to keep using these to set your server.properties, you can leave it as `true`. Otherwise, leave it as false. Force redownload will do the same for things such as the core server binaries. You'll usually want this `false` unless something goes very wrong, and you wish to reset your server without remaking the world. 

```
  userID: 1000
  groupID: 999
```

Finally, we have the group and user ID. The above values are what your server will use to run. When you create an SSH server to gain file access, each user has a group and user ID. More on that will be within the article. You can leave these alone unless you have multiple admins that you only wish to manage specific servers. 


## Deploying

Let's make a server directory on your local machine! This way, we can keep the server config file for later adjustments if needed. [Right click this link](https://raw.githubusercontent.com/mcserverhosting-net/mc-operator/master/server-op/deploy/crds/mcserverhosting.net_v2_minecraftserver_cr.yaml) and save this file to your directory!

Make any adjustments you see fit. Once you're ready, let's deploy the server!

1. Navigate to your working directory by running `cd path/to/your/directory/you/made`
2. Run `mcsh apply -f server.yaml`
3. Check on the server with `mcsh get pods`

If it is showing as creating, you're on your way to a new Minecraft server! 

Congratulations!

You can now attach to your server's console by running `mcsh attach -it your-server-pod-id`, which you can find by running `kubectl get pods`! Try OPing yourself by attaching and running `op your-user-name`.


### Troubleshooting
If, for some reason, your server doesn't get accepted or still shows as pending, check the errors shown when you try to deploy it. 
You can see these errors after you run the command or in `mcsh get events`. A common one is setting the RAM value to high. Ensure it is within your purchased quota! 
