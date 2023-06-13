kubectl exec -n tools -it jenkins-745954bdbf-hqzzq -- cat /var/jenkins_home/secrets/initialAdminPassword

kubectl exec -it nexus-7d49586c8b-29lfl -n tools cat /nexus-data/admin.password

kubectl get secret $(kubectl get serviceaccount jenkins -o jsonpath='{.secrets[0].name}') -o jsonpath='{.data.token}' | base64 --decode
