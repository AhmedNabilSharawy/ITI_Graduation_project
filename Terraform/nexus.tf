resource "kubernetes_deployment" "nexus" {
  metadata {
    name      = "nexus"
    namespace = "tools"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nexus"
      }
    }

    template {
      metadata {
        labels = {
          app = "nexus"
        }
      }

      spec {
        container {
          image = "sonatype/nexus3"
          name  = "nexus"

          port {
            name          = "nexus"
            container_port = 8081
          }

          port {
            name          = "docker"
            container_port = 5000
          }
        }
      }
    }
  }
}



resource "kubernetes_service" "nexus-service" {
  metadata {
    name      = "nexus-service"
    namespace = "tools"
  }

  spec {
    selector = {
      app = "nexus"
    }

    port {
      name        = "http"
      port        = 80
      protocol    = "TCP"
      target_port = 8081
    }
  }
    provisioner "local-exec" {
    command = "kubectl apply -f ingress.yaml"
}
}

resource "kubernetes_service" "docker-service" {
  metadata {
    name      = "docker-service"
    namespace = "tools"
  }

  spec {
    selector = {
      app = "nexus"
    }
    port {
      name        = "docker"
      port        = 5000
      protocol    = "TCP"
      target_port = 5000
    }

    type = "ClusterIP"
  }
}
