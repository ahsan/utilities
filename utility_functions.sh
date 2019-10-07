get_inside_pod() {
	pod_name=$(get_pod $1)
	echo $pod_name
	kubectl exec -it "$pod_name" -- sh
}

get_pod() {
	if [ -z "$1" ]
		then
			echo "Pod name not specified"
			exit 1
	fi
	pod_name=$(kubectl get pods | grep "$1" | awk 'NR==1{print $1}')
	echo $pod_name
}
