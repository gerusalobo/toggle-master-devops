resource "kubernetes_secret" "auth" {
  metadata {
    name      = "auth-secret"
    namespace = "toggle-prod"
  }

  type = "Opaque"

  data = {
    DATABASE_URL = "postgresql://${module.rds_auth.username}:${var.auth_db_password}@${module.rds_auth.endpoint}:${module.rds_auth.port}/${module.rds_auth.database_name}"
    MASTER_KEY   = var.auth_master_key
  }

  depends_on = [
    module.rds_auth
  ]
}