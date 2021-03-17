---
title: "How to access Minecraft Server files"
author: "quantomworks"
tags: ["cli", "server", "minecraft", "create"]
date: 2020-07-11T18:09:11-04:00
draft: false
---

{{< amp-img width="1280" height="720" layout="responsive" src="/support/img/Real-Filing-Cabinet-Mod.jpg" alt="There's a mod out there called real filing cabinent mod and it's pretty cool." >}}

When we give you a minecraft namespace, three primary folders may appear. One would be for your servers. The second, for your bungee or proxy servers. The third, your web directory.

In order to access these files, you'll need an SSH key. This key will be used to authenticate you to your files. This works better than a password, as often malicious users will try to brute force their way into your account by using a script on a remote machine. 

## Generating a key

The mcsh cli package comes with `ssh-keygen`. You can use this to generate a key.


1. Run `ssh-keygen`
2. Hit `[Enter]` when asked "Enter file in which to save the key" to use the default location
3. Type in a passphrase, or leave it blank (you won't be able to see what you type)
4. Type in the same passphrase again, or hit enter if it was blank


Success! You now have a ssh key ready to use with your server. 


## Enabling the SFTP server

For file access, you will need to spin up an ssh server. We make this process similar to a minecraft server. 

What you will need:

1. Your SFTP *public* key. The location of this was shown in the output. In my example, it was located at `C:\Users\shaba/.ssh/id_rsa.pub`
2. A username you wish to use

Let's create the SFTP server.

```
apiVersion: mcserverhosting.net/v2
kind: SFTPServer
metadata:
  name: example-sftpserver
spec:  
  online: true
  users:
  - groupID: 1000
    publicKey: your-ssh-public-key 
    userID: 1001
    username: your-username
```

1. Copy the file above and save it as **sftp-server.yml**. 
2. Open up your `id_rsa.pub` file inside of notepad.
3. Copy the contents of `id_rsa.pub`
4. Paste the contents of that public key in place of `your-ssh-public-key`
5. Finally, run `mcsh create -f sftp-server.yml`

Your SFTP server will come online! 

From here, you have a few ways to access your files.

- From the [WinSCP client](/support/post/how-to-access-files-using-winscp/)
- From Window's exporer (coming soon)
