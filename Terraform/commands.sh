minikube start --driver=virtualbox  --cpus 4 --memory 8g --disk-size 20g

kubectl exec -n tools -it jenkins-745954bdbf-shsn9 -- cat /var/jenkins_home/secrets/initialAdminPassword

kubectl exec -it nexus-6b5bd9f4ff-lfrmr -n tools cat /nexus-data/admin.password

kubectl get secret $(kubectl get serviceaccount jenkins -n tools -o jsonpath='{.secrets[0].name}') -o jsonpath='{.data.token}' | base64 --decode

minikube addons enable ingress

kubectl get deployments --as system:serviceaccount:jenkins -n dev
kubectl auth can-i create deployments --as=system:serviceaccount:dev:jenkins -n dev

echo -n "ahmed" | base64
echo "bmFiaWw=" | base64 --decode

kubectl exec -it mysql-7cccd7f54d-xj42n -n dev -- mysql -u ahmed -p
