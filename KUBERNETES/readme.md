use terraform to create workstation
attach iam role /or configure aws credentials
create cluster using workstation 
eksctl create cluster --config-file=filename.yaml
use kubens from github to set default namespace -optional

edit security grps of cluster instances to allow all traffic from all ports


to use stateful sets:
install ebs drivers
ec2 instances(nodes) should have EBSdriverpolicy access in aws console
create Storageclass


add helm repo --> kubernetes resource files
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
helm repo update
helm upgrade --install aws-ebs-csi-driver --namespace kube-system aws-ebs-csi-driver/aws-ebs-csi-driver


install k9s for better UI
curl -sS https://webinstall.dev/k9s | bash



horizontal pod autoscaling (HPA)
requirements:
metric API : kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability-1.21+.yaml
deployment should have limites mentioned