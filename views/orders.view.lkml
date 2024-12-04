view: orders {

  sql_table_name: `bigquery-public-data.thelook_ecommerce.orders`;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
    label: "Order ID"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, hour, date, week, day_of_week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }

  measure: number_of_items {
    type: sum
    sql: ${TABLE}.num_of_item ;;
  }

  dimension: is_returned {
    type: yesno
    sql: ${TABLE}.returned_at IS NOT NULL ;;
    label: "Is Returned"
  }
}
