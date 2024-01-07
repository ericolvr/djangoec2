# Django on EC2 #
Runing Django on EC2 with Docker and CI / CD process


### AWS - EC2 ##
https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#Home:

```shell
1) Network & Security
2) Key Pair
   - create new key pair

3) Instance
4) Launch Instance
   - set a name for instance
   - select your os
   - select your generated key pair
   - allow http and https
   - click on launch instance
   - configure port and relase 8000
```


### Docker Hub ##
https://hub.docker.com/
```shell
1) Create new repository for your Image
```

### GitHub ##
```shell
1) Acces your project
2) Click in Actions
3) Click in Runner
4) Click in New Self Hosted Runner
5) Select your Platform
6) Select your OS
7) Connect to your Instace using SSH
ssh -i <key.pem> user@pulicip
```

### on AWS Terminal Instance ##
Paste this commands

Download
```
# Create a folder
$ mkdir actions-runner && cd actions-runner

# Download the latest runner package
$ curl -o actions-runner-osx-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-osx-x64-2.311.0.tar.gz

# Optional: Validate the hash
$ echo "f4d8d1dd850fd0889e0d250c82fa587b0e21934f8441143ee6772284b2ae6211  actions-runner-osx-x64-2.311.0.tar.gz" | shasum -a 256 -c

# Extract the installer
$ tar xzf ./actions-runner-osx-x64-2.311.0.tar.gz
```

Configure
```
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/ericolvr/objective --token AABSJE4SBTCLG77FBGYSPK3FTFT4W

# Last step, run it!
$ ./run.sh &
```


### Install Docker on Instance ##
https://docs.docker.com/engine/install/ubuntu/

```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Checking Docker instalation
1) sudo su 
2) docker ps
3) get docker ip ( used on Nginx )
- docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' CONTAINER ID



## CI / CD FILES ##
```
1) mkdir .github
2) mkdir .github/workflows
3) create CI file ci.yml and cd.yml based on links
```
[CI Sample File](https://github.com/ericolvr/djangoec2/blob/master/.github/workflows/ci.yml)

[CD Sample File](https://github.com/ericolvr/djangoec2/blob/master/.github/workflows/cd.yml)


### Todo ##
1) Setup Nginx
2) Integration with K8S

[K8S reference](https://github.com/ericolvr/K8S)
