view: orders {

  sql_table_name: `bigquery-public-data.thelook_ecommerce.orders`;;

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }
}
