[Ya-Ha!](https://www.youtube.com/watch?v=CrMArekfBBM)

## Instruction

1. @everyone put shared keys as ~/.ssh/isu9q and ~/.ssh/isu9q.pub

2. @karszawa copies ssh keys to servers

```bash
# Run this command for each servers
ssh-copy-id -i ~/.ssh/isu9q isucon@$ipaddr
```

3. @everyone paste the script below to ~/.ssh/config with **correct ip addresses**

```
Host isu9q-01
  HostName $addr1
  User isucon
  Port 22
  IdentityFile ~/.ssh/isu9q

Host isu9q-01
  HostName $addr2
  User isucon
  Port 22
  IdentityFile ~/.ssh/isu9q

Host isu9q-03
  HostName $addr3
  User isucon
  Port 22
  IdentityFile ~/.ssh/isu9q
```

4. @karszawa setup git in the master server

5. @karszawa setup git in the slave servers
