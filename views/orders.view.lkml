view: orders {

  sql_table_name: `bigquery-public-data.thelook_ecommerce.orders`;;

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
    label: "Order ID"
  }

  dimension_group: ordered {
    type: time
    timeframes: [
      raw,
      date,
      hour,
      week,
      month,
      quarter,
      year,
      day_of_week,
      week_of_year,
      month_name,
      day_of_month,
      hour_of_day,
      time_of_day
    ]
    convert_tz: yes
    sql: ${TABLE}.created_at;;
  }

}
