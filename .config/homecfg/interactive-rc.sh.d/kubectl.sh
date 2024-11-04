#!/usr/bin/env sh

# ---
# kubectl aliases from oh-my-zsh kubectl plugin
# https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/kubectl/kubectl.plugin.zsh
# ---
if type kubectl &>/dev/null; then
    # This command is used a LOT both below and in daily life
    alias k=kubectl

    # Execute a kubectl command against all namespaces
    alias kca='_kca(){ kubectl "$@" --all-namespaces;  unset -f _kca; }; _kca'

    # Apply a YML file
    alias kaf='echorun kubectl apply -f'

    # Drop into an interactive terminal on a container
    alias keti='echorun kubectl exec -t -i'

    # Manage configuration quickly to switch contexts between local, dev and staging.
    alias kcuc='echorun kubectl config use-context'
    alias kcsc='echorun kubectl config set-context'
    alias kcdc='echorun kubectl config delete-context'
    alias kccc='echorun kubectl config current-context'

    # List all contexts
    alias kcgc='echorun kubectl config get-contexts'

    # General aliases
    alias kdel='echorun kubectl delete'
    alias kdelf='echorun kubectl delete -f'

    # Pod management.
    alias kgp='echorun kubectl get pods'
    alias kgpa='echorun kubectl get pods --all-namespaces'
    alias kgpw='kgp --watch'
    alias kgpwide='kgp -o wide'
    alias kep='echorun kubectl edit pods'
    alias kdp='echorun kubectl describe pods'
    alias kdelp='echorun kubectl delete pods'
    alias kgpall='echorun kubectl get pods --all-namespaces -o wide'

    # get pod by label: kgpl "app=myapp" -n myns
    alias kgpl='kgp -l'

    # get pod by namespace: kgpn kube-system"
    alias kgpn='kgp -n'

    # Service management.
    alias kgs='echorun kubectl get svc'
    alias kgsa='echorun kubectl get svc --all-namespaces'
    alias kgsw='kgs --watch'
    alias kgswide='kgs -o wide'
    alias kes='echorun kubectl edit svc'
    alias kds='echorun kubectl describe svc'
    alias kdels='echorun kubectl delete svc'

    # Ingress management
    alias kgi='echorun kubectl get ingress'
    alias kgia='echorun kubectl get ingress --all-namespaces'
    alias kei='echorun kubectl edit ingress'
    alias kdi='echorun kubectl describe ingress'
    alias kdeli='echorun kubectl delete ingress'

    # Namespace management
    alias kgns='echorun kubectl get namespaces'
    alias kens='echorun kubectl edit namespace'
    alias kdns='echorun kubectl describe namespace'
    alias kdelns='echorun kubectl delete namespace'
    alias kcn='echorun kubectl config set-context --current --namespace'

    # ConfigMap management
    alias kgcm='echorun kubectl get configmaps'
    alias kgcma='echorun kubectl get configmaps --all-namespaces'
    alias kecm='echorun kubectl edit configmap'
    alias kdcm='echorun kubectl describe configmap'
    alias kdelcm='echorun kubectl delete configmap'

    # Secret management
    alias kgsec='echorun kubectl get secret'
    alias kgseca='echorun kubectl get secret --all-namespaces'
    alias kdsec='echorun kubectl describe secret'
    alias kdelsec='echorun kubectl delete secret'

    # Deployment management.
    alias kgd='echorun kubectl get deployment'
    alias kgda='echorun kubectl get deployment --all-namespaces'
    alias kgdw='kgd --watch'
    alias kgdwide='kgd -o wide'
    alias ked='echorun kubectl edit deployment'
    alias kdd='echorun kubectl describe deployment'
    alias kdeld='echorun kubectl delete deployment'
    alias ksd='echorun kubectl scale deployment'
    alias krsd='echorun kubectl rollout status deployment'

    function kres(){
      kubectl set env $@ REFRESHED_AT=$(date +%Y%m%d%H%M%S)
    }

    # Rollout management.
    alias kgrs='echorun kubectl get replicaset'
    alias kdrs='echorun kubectl describe replicaset'
    alias kers='echorun kubectl edit replicaset'
    alias krh='echorun kubectl rollout history'
    alias kru='echorun kubectl rollout undo'

    # Statefulset management.
    alias kgss='echorun kubectl get statefulset'
    alias kgssa='echorun kubectl get statefulset --all-namespaces'
    alias kgssw='kgss --watch'
    alias kgsswide='kgss -o wide'
    alias kess='echorun kubectl edit statefulset'
    alias kdss='echorun kubectl describe statefulset'
    alias kdelss='echorun kubectl delete statefulset'
    alias ksss='echorun kubectl scale statefulset'
    alias krsss='echorun kubectl rollout status statefulset'

    # Port forwarding
    alias kpf="kubectl port-forward"

    # Tools for accessing all information
    alias kga='echorun kubectl get all'
    alias kgaa='echorun kubectl get all --all-namespaces'

    # Logs
    alias kl='echorun kubectl logs'
    alias kl1h='echorun kubectl logs --since 1h'
    alias kl1m='echorun kubectl logs --since 1m'
    alias kl1s='echorun kubectl logs --since 1s'
    alias klf='echorun kubectl logs -f'
    alias klf1h='echorun kubectl logs --since 1h -f'
    alias klf1m='echorun kubectl logs --since 1m -f'
    alias klf1s='echorun kubectl logs --since 1s -f'

    # File copy
    alias kcp='echorun kubectl cp'

    # Node Management
    alias kgno='echorun kubectl get nodes'
    alias keno='echorun kubectl edit node'
    alias kdno='echorun kubectl describe node'
    alias kdelno='echorun kubectl delete node'

    # PVC management.
    alias kgpvc='echorun kubectl get pvc'
    alias kgpvca='echorun kubectl get pvc --all-namespaces'
    alias kgpvcw='kgpvc --watch'
    alias kepvc='echorun kubectl edit pvc'
    alias kdpvc='echorun kubectl describe pvc'
    alias kdelpvc='echorun kubectl delete pvc'

    # Service account management.
    alias kdsa="kubectl describe sa"
    alias kdelsa="kubectl delete sa"

    # DaemonSet management.
    alias kgds='echorun kubectl get daemonset'
    alias kgdsw='kgds --watch'
    alias keds='echorun kubectl edit daemonset'
    alias kdds='echorun kubectl describe daemonset'
    alias kdelds='echorun kubectl delete daemonset'

    # CronJob management.
    alias kgcj='echorun kubectl get cronjob'
    alias kecj='echorun kubectl edit cronjob'
    alias kdcj='echorun kubectl describe cronjob'
    alias kdelcj='echorun kubectl delete cronjob'

    # Job management.
    alias kgj='echorun kubectl get job'
    alias kej='echorun kubectl edit job'
    alias kdj='echorun kubectl describe job'
    alias kdelj='echorun kubectl delete job'
fi