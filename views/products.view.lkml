view: products {

  sql_table_name: `bigquery-public-data.thelook_ecommerce.products`;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    label: "Product ID"
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    label: "Category"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Product Name"
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    label: "Product Brand"
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
    label: "Product Department"
  }

  measure: cost {
    type: sum
    sql: ${TABLE}.cost;;
  }

  measure: retail_price {
    type: sum
    sql: ${TABLE}.retail_price;;
  }
}
