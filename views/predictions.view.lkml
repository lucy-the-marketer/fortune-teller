view: predictions {
  derived_table: {
    sql: SELECT * FROM ML.PREDICT(
          MODEL `fortune-teller-443709.bqml.model_{% parameter model_name %}`,
          (SELECT * FROM `fortune-teller-443709.bqml.view_{% parameter model_name %}`));;
  }

  parameter: model_name {
    type: unquoted
    suggest_explore: bqml_models
    suggest_dimension: model_name
  }

  dimension: order_id {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.order_items_id ;;
  }

  # The output column for BigQuery ML.PREDICT function will be predicted_<label_column_name>
  # https://cloud.google.com/bigquery-ml/docs/reference/standard-sql/bigqueryml-syntax-predict

  measure: predicted_is_returned {
    label: "Predicted Return Probability"
    description: "Predicted probability of a return (as provided by ML.PREDICT)"
    type: average
    sql: ${TABLE}.predicted_order_items_is_returned ;;
    value_format_name: percent_1
  }

  measure: predicted_order_items_net_sales {
    label: "Predicted Net Sales"
    description: "Predicted Net Sales (as provided by ML.PREDICT)"
    type: sum
    sql: ${TABLE}.predicted_order_items_net_sales ;;
    value_format_name: usd
  }

}
