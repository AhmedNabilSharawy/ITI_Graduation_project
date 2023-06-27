resource "kubernetes_secret" "mysql_secrets" {
  metadata {
    name      = "mysql-secrets"
    namespace = "dev"
  }

  data = {
    mysql-root-password = "root"
    mysql-user         = "ahmed"
    mysql-password     = "nabil"
  }

  type = "Opaque"
}
