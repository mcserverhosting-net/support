---
title: "How to access files using WinSCP"
author: "quantomworks"
tags: ["ssh", "files", "terminal"]
categories: ["Getting Started"]
servertypes: ["all"]
date: 2019-12-28T04:37:53-05:00
draft: false
---

{{< amp-img width="1280" height="720" layout="responsive" src="/support/img/computer-craft-terminal.jpg" alt="Computer Craft is an awesome mod by the way." >}}


With SSH, you can access your Minecraft Server’s console (on MSCH based servers), files and folders. Edit them right from your desktop as well! We’ll go over a few programs to get you started.

### What you’ll need:

1. Your **username**.
2. Your **id_rsa** file [you can generate by following this guide](/support/post/how-to-access-minecraft-server-files/).
3. Your **SSH port** (found by running `mcsh get services`).
4. [PuTTyGen](https://the.earth.li/~sgtatham/putty/latest/w64/puttygen.exe).


### Let’s get started.

{{< amp-img width="473" height="481" layout="responsive" src="/support/img/putty-key-generator.png" alt="puttygen.exe" >}}

First, we’ll go about converting the key from OpenSSH to a PuTTy format.
1. Open PuTTyGen
2. Conversions > Import Key
3. Select the id_rsa file
4. Hit “Save Private Key”
5. You’ll be asked if it’s ok to save without a passphrase. You can hit yes or type in a passphrase. You’ll have to use it later though.

---


### Now, let's access your files.
What you’ll need from here:
1. WinSCP
2. The saved session from the first step.

{{< amp-img width="753" height="773" layout="responsive" src="/support/img/winscp-session.png" alt="WinSCP’s home screen" >}}

WinSCP works to give access to your files securely using your public key!

1. From the home screen, select **New Site**
2. On the right panel, under **Host name**: type in `ssh.mcserverhosting.red` for NA or `ssh.mcserverhosting.blue` for EU
3. For the **port number**, type in your SSH port
4. For the **username**, type in your usernme
5. ***Under*** password, hit **Advanced...**
6. On the left panel, under SSH, click **Authentication**
7. Click the three dots **"..."** under **Private key file**
8. Find and select the converted **ppk file** from the previous steps. 
9. Hit **OK**.
10. Hit **Save**, and give the site a name like "My MCSH Namespace", then OK again
11. Hit **Login**.

You’ll see your server’s `minecraft` folder on the right, and your files on the left.

That’s it! You know the basics! If you have any questions, reach out to us on discord at https://mcserverhosting.net/discord