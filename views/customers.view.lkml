view: customers {
  sql_table_name: `bigquery-public-data.thelook_ecommerce.users` ;;
  drill_fields: [id, name, registered_time]

  dimension: id {
    value_format_name: id
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.street_address ;;
    group_label: "Address Info"
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    group_label: "Address Info"
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    group_label: "Address Info"
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: registered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: time_as_a_customer {
    type: duration
    sql_start: ${registered_raw} ;;
    sql_end: CURRENT_TIMESTAMP ;;
  }

  dimension: email {
    type: string
    group_label: "Address Info"
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    hidden: yes
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    hidden: yes
    sql: ${TABLE}.last_name ;;
  }

  dimension: name {
    type: string
    sql: CONCAT(${first_name}, " ", ${last_name}) ;;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    group_label: "Address Info"
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: state {
    type: string
    group_label: "Address Info"
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: postcode {
    type: zipcode
    group_label: "Address Info"
    sql: ${TABLE}.postcode ;;
  }

  measure: number_of_customers {
    type: count_distinct
    sql:  ${id} ;;
  }

}
