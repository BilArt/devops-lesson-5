This project provisions an EKS cluster, pushes a Django app image to ECR, and deploys it via a Helm chart (with Service, ConfigMap, and HPA).

## What’s included
- Terraform modules for VPC, EKS, ECR (structure as per assignment)
- Dockerfile for the Django app
- Helm chart: Deployment, Service (LoadBalancer), ConfigMap, HPA
- Example values.yaml
- Health endpoint: `/health/`

## Quick Deploy (already done in our session)
1. Build & push image to ECR.
2. `helm upgrade --install django-app charts/django-app -f charts/django-app/values.yaml`
3. Get external URL: `kubectl get svc django-service -o wide`
4. Check: `curl http://<ELB>/health/` → should return `OK`.

## HPA
- Targets CPU utilization 70%
- Min replicas: 2, Max replicas: 6
- Requires metrics-server (installed in our session)

## Notes
- Environment variables are provided via ConfigMap (see `charts/django-app/templates/configmap.yaml`).
- Gunicorn serves the app on `0.0.0.0:8000`.