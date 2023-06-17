resource "kubernetes_service" "my_service" {
  metadata {
    name      = "my-service"
    namespace = "dev"
  }

  spec {
    selector = {
      app = "my-app"
    }
    type = "NodePort"

    port {
      protocol    = "TCP"
      port        = 3000
      target_port = 3000
      node_port   = 30000
    }
  }
}
