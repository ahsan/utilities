shell_into_pod() {
	pod_name=$(pod_name $1)
	echo $pod_name
	kubectl exec -it "$pod_name" -- sh
}

pod_logs() {
	pod_name=$(pod_name $1)	
	echo $pod_name
	kubectl logs -f --tail=10 "$pod_name" | jq
}

pod_name() {
	if [ -z "$1" ]
		then
			echo "Pod name not specified"
			exit 1
	fi
	pod_name=$(kubectl get pods | grep "$1" | awk 'NR==1{print $1}')
	echo $pod_name
}

ctx_current() {
	kubectl config view -o=jsonpath='{.current-context}'
}

ctx_list() {
	kubectl config get-contexts -o=name
}
