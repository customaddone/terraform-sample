resource "aws_db_option_group" "example" {
  name                 = "example"
  # mysqlとかpostgressとかを記入する
  engine_name          = "mysql"
  major_engine_version = "5.7"

  # アクテビティ記録のためのプラグイン
  option {
    # option_name = "MARIADB_AUDIT_PLUGIN"
  }
}
