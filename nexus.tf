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
      port        = 8081
      protocol    = "TCP"
      target_port = 8081
    }

    type = "NodePort"
  }
}


resource "kubernetes_deployment" "nexus" {
  metadata {
    name      = "nexus"
    namespace = "tools"
    labels = {
      app = "nexus"
    }
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
          name  = "nexus"
          image = "sonatype/nexus3"

          port {
            name          = "nexus"
            container_port = 8081
          }
        }
      }
    }
  }
}
