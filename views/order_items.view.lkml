view: order_items {
  sql_table_name: `bigquery-public-data.thelook_ecommerce.order_items` ;;
  drill_fields: [order_id, inventory_item_id, sale_price, created_time, returned_time]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    hidden: yes
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    hidden: yes
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: last_order_date {
    view_label: "Customers"
    type: date
    sql: MAX(${created_date}) ;;
  }

  measure: number_of_orders {
    view_label: "Customers"
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: return_count {
    view_label: "Customers"
    type: count_distinct
    sql: ${returned_raw} ;;
  }

  measure: has_returns {
    view_label: "Customers"
    type: string # setting as string as BQML will auto cast bool to a string. This causes issues in ML.PREDICT functions
    sql: CAST(${return_count} > 0 AS string) ;;
  }

  measure: total_returns {
    view_label: "Customers"
    type: sum
    sql: ${sale_price} ;;
    filters: [returned_time: "NOT NULL"]
    value_format_name: usd_0
  }

  measure: gross_sales {
    view_label: "Customers"
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd_0
  }

  measure: net_sales {
    view_label: "Customers"
    type: number
    sql: ${gross_sales} - ${total_returns} ;;
    value_format_name: usd_0
  }

  measure: average_sales_per_customer {
    type: number
    sql: ${gross_sales} / ${customers.number_of_customers} ;;
    value_format_name: usd_0
  }
}
