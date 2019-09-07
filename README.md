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

4. @karszawa setup git

```
cd scripts
./git-master.sh isu9q-01
./git-slave.sh isu9q-02 service-name
./git-slave.sh isu9q-03 service-name
```

5. @karszawa move middleware config files to git repository and create symbolic links

```
cd scripts
./ln-master.sh isu9q-01 service-name
./ln-slave.sh isu9q-02 service-name
./ln-slave.sh isu9q-03 service-name
```
