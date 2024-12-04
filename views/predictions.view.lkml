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
    sql: ${TABLE}.order_items_order_id ;;
  }

  # The output column for BigQuery ML.PREDICT function will be predicted_<label_column_name>
  # https://cloud.google.com/bigquery-ml/docs/reference/standard-sql/bigqueryml-syntax-predict

  measure: predicted_is_returned {
    label: "Predicted Return Probability"
    description: "Predicted probability of a return (as provided by ML.PREDICT)"
    type: max
    sql: ${TABLE}.predicted_orders_is_returned ;;
    value_format_name: percent_1
  }

  measure: actual_is_returned {
    label: "Actual Return Status"
    description: "Actual return status for the order"
    type: yesno
    sql: CASE
           WHEN ${order_items.is_returned} = 'Yes' THEN 1
           ELSE 0
         END ;;
  }

  measure: residual {
    label: "Residual"
    description: "Difference between the actual return status and predicted probability"
    type: number
    sql: ABS(${actual_is_returned} - ${predicted_is_returned}) ;;
    value_format_name: percent_1
  }

  measure: residual_percent {
    label: "Residual Percentage"
    description: "Residual as a percentage of the predicted return probability"
    type: number
    sql: ABS(1.0 * ${residual} / NULLIF(${predicted_is_returned}, 0)) ;;
    value_format_name: percent_1
  }

}
