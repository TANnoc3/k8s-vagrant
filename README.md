# 検証用

## 起動

node-1
```
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=172.16.20.11
```

```
kubectl apply -f kube-flannel.yml
```

## メモ
- flannelを使う際にはflanneldの引数に`--iface=<interface>`を指定すること
- `kubeadm init`する際には`/etc/systemd/system/kubelet.service.d/10-kubeadm.conf`のkubeletの引数に`--node-ip=<ip-addr>`を追加する
