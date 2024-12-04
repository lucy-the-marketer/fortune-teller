connection: "lookerdata"

include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: orders {

  join: order_items {
  relationship: many_to_one
  sql_on: ${orders.order_id} = ${order_items.order_id} ;;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.id} ;;
  }


}
