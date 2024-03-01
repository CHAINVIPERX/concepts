use terraform to create workstation
attach iam role /or configure aws credentials
create cluster using workstation 
eksctl create cluster --config-file=filename.yaml
use kubens from github to set default namespace -optional

edit security grps of cluster instances to allow all traffic from all ports