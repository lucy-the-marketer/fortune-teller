connection: "lookerdata"

include: "/views/*.view"

explore: orders {
  label: "Fortune Teller"
  always_filter: {
    filters: [predictions.model_name: ""]
  }


  join: customers {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${customers.id} ;;
  }

  join: order_items {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.id} ;;
  }

  join: predictions {
    relationship: one_to_one
    sql_on: ${predictions.order_id} = ${orders.order_id} ;;
  }
}

explore: bqml_models{}
