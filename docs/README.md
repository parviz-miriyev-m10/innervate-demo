# Documentation & Evidence

This directory contains screenshots, logs, and other evidence demonstrating the successful implementation of all assignment requirements.

## Required Evidence

### 1. Autoscaling Demonstration

**How to capture:**
```bash
# 1. Start monitoring
kubectl get hpa flask-app -w

# 2. In another terminal, generate load
hey -n 1000 -c 10 http://localhost:8080/

# 3. Take screenshots of scaling behavior
kubectl get pods
kubectl describe hpa flask-app
```

### 2. Network Policy Verification

**How to capture:**
```bash
# 1. List network policies
kubectl get networkpolicies

# 2. Test pod-to-pod communication (should fail)
kubectl exec -it <pod-name> -- curl http://<other-pod-ip>:8080/

# 3. Test ingress traffic (should work)
curl http://localhost:8080/
```

### 3. Incident Simulation & Resolution

**How to capture:**
```bash
# 1. Trigger chaos
curl http://localhost:8080/chaos

# 2. Monitor pod restarts
kubectl get pods -w

# 3. Check health endpoint
kubectl exec -it <pod-name> -- curl http://localhost:8080/healthz

# 4. Verify recovery
curl http://localhost:8080/
```

## Evidence Checklist
- [x] Autoscaling screenshots and logs
- [x] Network policy verification
- [x] Incident simulation evidence
- [x] Recovery verification
- [x] All commands and outputs documented
