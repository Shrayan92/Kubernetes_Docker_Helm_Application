# Hello Service

### A simple Spring Boot web application deployed using Docker and Helm to highlight the directory structure of helm charts and usages of different files inside helm folder.

## 📁 Helm Chart Explanation

The Helm chart is organized under `helm/hello-service` and consists of the following components:

### Chart.yaml
Defines metadata about the Helm chart such as:
- `name`: Name of the chart.
- `description`: A short description of the application.
- `version`: Version of the chart itself.
- `appVersion`: The version of the application being deployed.

### values.yaml
A configuration file for customizing the deployment without modifying the templates.
- `replicaCount`: Number of pod replicas to run.
- `image.repository`: Docker image repository.
- `image.tag`: Docker image tag.
- `service`: Defines the service type and port.
- `ingress`: Enables ingress and defines rules such as host and path.

### templates/
Contains Kubernetes resource templates that Helm uses to generate manifests.

- `deployment.yaml`: Defines the deployment, specifying how many replicas to run, the image to use, and which ports to expose.
- `service.yaml`: Creates a Kubernetes Service to expose the deployment within the cluster.
- `ingress.yaml`: (Optional) Creates an Ingress resource to expose the service externally via HTTP. Useful when using an Ingress controller like NGINX.
- `_helpers.tpl`: Stores reusable template snippets, such as naming conventions. This promotes consistency across templates.

## 🚀 Deployment Instructions

### Prerequisites

- Docker
- Helm 3+
- Kubernetes cluster (e.g., Minikube, EKS)
- GitLab runner configured with Docker and Helm

### Build & Push Docker Image
### Change as per the name of the username and registry
```sh
docker build -t myregistry/hello-service .
docker push myregistry/hello-service
```

### Deploy with Helm

```sh
cd helm/hello-service
helm install hello-service .
```

### Access the App

If using Minikube:

```sh
minikube tunnel
curl http://hello.local/hello
```

Or map the domain in your `/etc/hosts`.

## 🧪 CI/CD

GitLab pipeline automates build, dockerization, and deployment using Helm.
