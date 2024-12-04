view: order_items {

  sql_table_name: `bigquery-public-data.thelook_ecommerce.order_items`;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    # hidden: yes
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
    label: "Order ID"
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
    label: "Product ID"
  }

  measure: sale_price {
    type: sum
    sql: ${TABLE}.sale_price ;;
  }
}
