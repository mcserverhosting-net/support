---
title: "Installing the MCSH-CLI"
author: "quantomworks"
tags: ["terminal", "cli"]
categories: ["Getting Started"]
servertypes: ["all"]
date: 2020-07-06T05:38:44-04:00
draft: false
---

{{< amp-img width="520" height="402" layout="responsive" src="https://www.pngitem.com/pimgs/m/20-209457_transparent-minecraft-icon-minecraft-diamond-shovel-png-png.png" alt="This isn't me, but it is a very cool picture." >}}



*Already have scoop.sh? Run `scoop install mcsh` after adding our bucket listed below.*

# How to setup the MCSH CLI on Windows

The MCSH command-line interface will give you console access, the ability to set up and modify your servers, create snapshots, and much more! This article will go over setting up your server. 

Before we continue, please ensure you register [here at our authentication server](https://keycloak.sfxworks.net/auth/realms/mcsh/account "Registration"). **Make sure to use the same email you purchased your namespace with!**

## Installing scoop

`scoop` is a package manager. A package manager is something that downloads and installs programs for you! Typically, you would download an executable file and go through some windows to install some applications. Using Scoop, we can simplify the process for developers on our end and you the user by running just one command to install it all! 

### Preparation

{{< amp-img width="842" height="241" layout="responsive" src="/support/img/powershell-set-execution.PNG" alt="Setting execution policy for POSH." >}}

First, open up, PowerShell.

We will run `Set-ExecutionPolicy RemoteSigned -scope CurrentUser` and then type in `Y` and `enter` to allow us to run this script to install scoop.sh.

1. Run `Set-ExecutionPolicy RemoteSigned -scope CurrentUser` to allow permission for the script
2. Run `iwr -useb get.scoop.sh | iex` to install scoop. [more information on scoop](https://scoop.sh/)

Scoop contains programs in what is known as "buckets". Buckets are a list of programs and their installation instructions. For the MCSH CLI, we will need a bucket called "extras" and our bucket named "MCSH".

{{< amp-img width="860" height="148" layout="responsive" src="/support/img/scoop-add-bucket.PNG" alt="Installing MCSH via POSH." >}}

3. Run `scoop bucket add extras` to add the extra directory listing
4. Run `scoop bucket add mcsh https://github.com/mcserverhosting-net/scoop.git` to add our directory listing and keep in sync with updates.

## Installing MCSH

{{< amp-img width="859" height="384" layout="responsive" src="/support/img/install-mcsh.PNG" alt="Installing MCSH via POSH." >}}

Now that we have everything we need, we are ready to install the mcsh CLI! It will install with one command!

1. Run `scoop install git`
2. Run `scoop install mcsh`

### Configuration

You've successfully installed the mcsh CLI! From here, you will have access to the NA and EU cluster. Let's do some post configuration.

We have two clusters. We want to make sure we are talking to the cluster your server is on.

- Run `mcsh config use-context mcsh-na` if you have a **NA** server
- Run `mcsh config use-context mcsh-eu` if you have an **EU** server

After this, we will tell the CLI to use your namespace. Our customers each have one namespace that keeps them isolated among the others. You can only see and control your servers on our clusters.

***Don't forget to replace your-namespace-here with your actual namespace!***
*Your namespace is in your email. If you don't know this, install*

- Run `mcsh config set-context --current --namespace=your-namespace-here` 

### Test things out!

Let's run a quick demo command! Once you try to get or edit resources in our cluster, a browser will go to our portal to log you in. Afterward, it will keep a token that will be valid for a set timeframe for you to execute any other commands. 

Try running `mcsh get minecraftservers`.

```~ $ mcsh get minecraftservers
No resources found in your namespace.
```

If it looked like this, don't worry. It worked! We need to create your first Minecraft server with us!

You're all set up! Please proceed to our next section on [Creating a Minecraft Server](/support/post/how-to-create-a-minecraft-server/)!
