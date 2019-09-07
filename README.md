[Ya-Ha!](https://www.youtube.com/watch?v=CrMArekfBBM)

## File Structure

- /etc - conf files
- /logs - access logs
- /scripts - scripts
- ...

## Instruction

1. @everyone put shared keys as ~/.ssh/isu9q and ~/.ssh/isu9q.pub
  * Add private keys in $HOME/home/isucon/.ssh/authorized_keys for `isucon` user.

2. @karszawa copies ssh keys to servers

```bash
./scripts/init/add-ssh 150.95.190.130 163.44.170.175 150.95.152.119
```

3. @everyone paste the script below to ~/.ssh/config with **correct ip addresses**

```
Host isu9q-01
  HostName 150.95.190.130
  User isucon
  Port 22
  IdentityFile ~/.ssh/isu9q

Host isu9q-02
  HostName 163.44.170.175
  User isucon
  Port 22
  IdentityFile ~/.ssh/isu9q

Host isu9q-03
  HostName 150.95.152.119
  User isucon
  Port 22
  IdentityFile ~/.ssh/isu9q
```

4. @everyone run bench
5. @everyone see application

6. @karszawa setup git

```
cd scripts
./git-master.sh isu9q-01
./git-slave.sh isu9q-02 service-name
./git-slave.sh isu9q-03 service-name
```

7. @karszawa move middleware config files to git repository and create symbolic links

```
cd scripts
./ln-master.sh isu9q-01 service-name
./ln-slave.sh isu9q-02 service-name
./ln-slave.sh isu9q-03 service-name
```
